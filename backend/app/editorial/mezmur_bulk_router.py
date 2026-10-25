"""Authenticated administration routes for durable Mezmur enrichment jobs."""
from fastapi import APIRouter, BackgroundTasks, Depends, Header, HTTPException, Query
from pydantic import BaseModel, Field
from uuid import UUID
from datetime import datetime, timezone
from .cms_auth import EditorialPrincipal, require_editorial_principal
from .mezmur_bulk import MezmurBulkStore

router = APIRouter(prefix="/api/mezmur-bulk", tags=["mezmur-bulk"])

class CreateJob(BaseModel):
    mode: str = Field(pattern="^(all|selected|zemari|classification|missing_categories|missing_occasions|retry_failed)$")
    import_ids: list[UUID] = Field(default_factory=list, max_length=2000)

class ApplySuggestions(BaseModel):
    suggestion_ids: list[UUID] = Field(min_length=1, max_length=100)

class PublishEligible(BaseModel):
    import_ids: list[UUID] = Field(min_length=1, max_length=2000)

def bearer_token(authorization: str | None) -> str:
    if not authorization or not authorization.lower().startswith("bearer "):
        raise HTTPException(status_code=401, detail="Authorization Bearer CMS session required.")
    return authorization[7:].strip()

@router.post("/jobs")
def create_job(body: CreateJob, background: BackgroundTasks, authorization: str | None = Header(default=None), principal: EditorialPrincipal = Depends(require_editorial_principal)):
    if body.mode == "selected" and not body.import_ids:
        raise HTTPException(status_code=422, detail="Select at least one Mezmur.")
    store = MezmurBulkStore()
    job, created = store.create_job_as_user(mode=body.mode, import_ids=[str(value) for value in body.import_ids], access_token=bearer_token(authorization))
    if created:
        background.add_task(MezmurBulkStore().run, str(job["id"]))
    return job

@router.get("/jobs/{job_id}")
def get_job(job_id: UUID, principal: EditorialPrincipal = Depends(require_editorial_principal)):
    _ = principal
    return MezmurBulkStore().job(str(job_id))

@router.get("/dashboard")
def dashboard(principal: EditorialPrincipal = Depends(require_editorial_principal)):
    _ = principal
    return MezmurBulkStore().dashboard()

@router.get("/jobs")
def jobs(limit: int = Query(20, ge=1, le=100), principal: EditorialPrincipal = Depends(require_editorial_principal)):
    _ = principal
    return MezmurBulkStore().jobs(limit)

@router.get("/jobs/{job_id}/suggestions")
def suggestions(job_id: UUID, offset: int = Query(0, ge=0), limit: int = Query(100, ge=1, le=250), principal: EditorialPrincipal = Depends(require_editorial_principal)):
    _ = principal
    return MezmurBulkStore().suggestions(str(job_id), offset, limit)

@router.post("/jobs/{job_id}/resume")
def resume(job_id: UUID, background: BackgroundTasks, principal: EditorialPrincipal = Depends(require_editorial_principal)):
    _ = principal
    store = MezmurBulkStore()
    job_key = str(job_id)
    job = store.transition_job(job_key, ["cancelled", "failed"], {"status": "queued", "error_message": None, "completed_at": None})
    if not job:
        raise HTTPException(status_code=409, detail="Only cancelled or failed jobs can be resumed.")
    background.add_task(MezmurBulkStore().run, job_key)
    return {"job_id": job_key, "status": "resume_requested"}

@router.post("/jobs/{job_id}/cancel")
def cancel(job_id: UUID, principal: EditorialPrincipal = Depends(require_editorial_principal)):
    _ = principal
    job_key = str(job_id)
    store = MezmurBulkStore()
    job = store.transition_job(job_key, ["queued"], {
        "status": "cancelled", "completed_at": datetime.now(timezone.utc).isoformat(),
    })
    if job:
        return {"job_id": job_key, "status": "cancelled"}
    job = store.transition_job(job_key, ["running"], {"status": "cancel_requested"})
    if job:
        return {"job_id": job_key, "status": "cancel_requested"}
    raise HTTPException(status_code=409, detail="Only queued or running jobs can be cancelled.")

@router.post("/jobs/{job_id}/suggestions/apply")
def apply_suggestions(job_id: UUID, body: ApplySuggestions, authorization: str | None = Header(default=None), principal: EditorialPrincipal = Depends(require_editorial_principal)):
    if principal.cms_role not in {"admin", "super_admin"}:
        raise HTTPException(status_code=403, detail="Admin or Super Admin is required to apply suggestions.")
    store = MezmurBulkStore()
    requested = [str(value) for value in body.suggestion_ids]
    allowed = {str(item["id"]) for item in store.rows("mezmur_enrichment_suggestions", {
        "select": "id", "job_id": f"eq.{str(job_id)}", "id": f"in.({','.join(requested)})",
    })}
    if not set(requested).issubset(allowed):
        raise HTTPException(status_code=422, detail="One or more suggestions do not belong to this job page.")
    results = []
    token = bearer_token(authorization)
    for suggestion_id in requested:
        try:
            data = store.user_rpc("apply_mezmur_enrichment_suggestion", {"p_suggestion_id": suggestion_id}, token)
            results.append({"suggestion_id": suggestion_id, "ok": True, "result": data})
        except HTTPException as exc:
            results.append({"suggestion_id": suggestion_id, "ok": False, "error": exc.detail})
    return results

@router.post("/publish")
def publish_eligible(body: PublishEligible, authorization: str | None = Header(default=None), principal: EditorialPrincipal = Depends(require_editorial_principal)):
    if principal.cms_role != "super_admin":
        raise HTTPException(status_code=403, detail="Super Admin is required for bulk publication.")
    token = bearer_token(authorization)
    aggregate: dict = {"published": 0, "skipped": 0, "failed": 0, "results": []}
    values = [str(value) for value in body.import_ids]
    store = MezmurBulkStore()
    for offset in range(0, len(values), 100):
        result = store.user_rpc("bulk_publish_mezmur_imports", {"p_import_ids": values[offset:offset + 100]}, token)
        if not isinstance(result, dict):
            raise HTTPException(status_code=502, detail="Bulk publication returned an invalid response.")
        for key in ("published", "skipped", "failed"):
            aggregate[key] += int(result.get(key) or 0)
        aggregate["results"].extend(result.get("results") or [])
    return aggregate
