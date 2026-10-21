/**
 * Backend theology prompt / terminology / quality helpers (Python modules in-repo).
 * Run: node scripts/test-theology-prompt.mjs
 */
import { spawnSync } from 'node:child_process'
import path from 'node:path'
import { fileURLToPath } from 'node:url'

const root = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..')
const serverPath = path.join(root, 'server').replace(/\\/g, '/')

const py = `
import json
import sys
sys.path.insert(0, r"${serverPath}")
from tewahedo_ai.theology_terminology import FIVE_MYSTERIES, FORBIDDEN_TRINITY_LABELS
from tewahedo_ai.theology_prompt import build_system_prompt, LITELLM_CHAT_DEFAULTS, build_litellm_messages
from tewahedo_ai.answer_quality import check_explanation_quality

assert len(FIVE_MYSTERIES) == 5
assert FIVE_MYSTERIES[0]["am"] == "\\u121d\\u1225\\u1322\\u1228 \\u1225\\u120b\\u1234"
assert FIVE_MYSTERIES[1]["am"] == "\\u121d\\u1225\\u1322\\u1228 \\u1225\\u130b\\u12cc"
assert FIVE_MYSTERIES[2]["am"] == "\\u121d\\u1225\\u1322\\u1228 \\u1325\\u121d\\u1240\\u1275"
assert FIVE_MYSTERIES[3]["am"] == "\\u121d\\u1225\\u1322\\u1228 \\u1241\\u122d\\u1263\\u1295"
assert FIVE_MYSTERIES[4]["am"] == "\\u121d\\u1225\\u1322\\u1228 \\u1275\\u1295\\u1223\\u12a4 \\u1219\\u1273\\u1295"

prompt = build_system_prompt(has_verified_scripture=True)
assert "Do NOT paste full verse quotations" in prompt
assert "###" in prompt
assert "Miaphysite" in prompt or "Tewahedo" in prompt
for row in FIVE_MYSTERIES:
    assert row["am"] in prompt
for bad in FORBIDDEN_TRINITY_LABELS:
    assert bad in prompt

prompt_no = build_system_prompt(has_verified_scripture=False)
assert "Scripture when no verified" in prompt_no

msgs = build_litellm_messages("What is the Trinity?", has_verified_scripture=True)
assert msgs[0]["role"] == "system"
assert msgs[-1]["role"] == "user"
assert isinstance(LITELLM_CHAT_DEFAULTS.get("max_tokens"), int)

bad = "1. " + FORBIDDEN_TRINITY_LABELS[0] + "\\n" + "\\u12e8\\u121a\\u12eb\\u1338_ cleanse"
codes = {i.code for i in check_explanation_quality(bad)}
assert "bad_trinity_label" in codes, codes
assert "amharic_latin_mix" in codes, codes

good_parts = [
    "1. " + FIVE_MYSTERIES[0]["am"] + " — Mystery of the Trinity",
    "English explanation: God is one in essence and three in Persons.",
    "Bible reference: Matthew 28:19.",
    "2. " + FIVE_MYSTERIES[1]["am"],
    "3. " + FIVE_MYSTERIES[2]["am"],
    "4. " + FIVE_MYSTERIES[3]["am"],
    "5. " + FIVE_MYSTERIES[4]["am"],
    "The Five Mysteries summarize EOTC catechesis.",
]
good_codes = {i.code for i in check_explanation_quality("\\n".join(good_parts))}
assert "bad_trinity_label" not in good_codes
assert "amharic_latin_mix" not in good_codes

print(json.dumps({"ok": True, "prompt_chars": len(prompt), "max_tokens": LITELLM_CHAT_DEFAULTS.get("max_tokens")}))
`

const result = spawnSync('python', ['-c', py], {
  cwd: root,
  encoding: 'utf8',
  env: { ...process.env, PYTHONIOENCODING: 'utf-8' },
})

if (result.status !== 0) {
  console.error(result.stdout)
  console.error(result.stderr)
  process.exit(result.status || 1)
}
console.log(result.stdout.trim())
console.log('test-theology-prompt: ok')
