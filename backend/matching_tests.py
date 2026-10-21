import json
import urllib.request
import urllib.parse

BASE = "http://127.0.0.1:8000"

tests = [
    {
        "name": "Bible John noisy ASR",
        "type": "chat",
        "input": "የዮሀንስ ዋንጌል ምዕራፍ ሁለት ቁጥር ሶስት",
        "expected_type": "bible_reference",
        "expected_reference": "John 2:3",
    },
    {
        "name": "Bible Genesis spoken",
        "type": "chat",
        "input": "ኦሪት ዘፍጥረት ምዕራፍ ሁለት ቁጥር አንድ",
        "expected_type": "bible_reference",
        "expected_reference": "Genesis 2:1",
    },
    {
        "name": "Bible canonical John",
        "type": "chat",
        "input": "ዮሐንስ 3፥16",
        "expected_type": "bible_reference",
        "expected_reference": "John 3:16",
    },
    {
        "name": "Hymn exact title",
        "type": "hymn",
        "input": "የስሙ ትርጓሜ",
        "expected_slug": "yesimu-tirguame",
    },
    {
        "name": "Hymn lyric phrase",
        "type": "hymn",
        "input": "የመላዕክት አለቃ ቅዱስ ሚካኤል",
        "expected_slug": "yesimu-tirguame",
    },
]

def post_chat(message):
    body = json.dumps({
        "message": message,
        "timezone": "America/New_York",
    }).encode("utf-8")

    req = urllib.request.Request(
        BASE + "/api/chat",
        data=body,
        headers={"Content-Type": "application/json"},
        method="POST",
    )

    with urllib.request.urlopen(req, timeout=30) as response:
        return json.loads(response.read().decode("utf-8"))

def hymn_search(query):
    params = urllib.parse.urlencode({
        "q": query,
        "limit": 10,
    })

    with urllib.request.urlopen(
        BASE + "/api/hymns/search?" + params,
        timeout=30,
    ) as response:
        return json.loads(response.read().decode("utf-8"))

passed = 0

for test in tests:
    try:
        if test["type"] == "chat":
            result = post_chat(test["input"])

            ok = (
                result.get("type") == test["expected_type"]
                and result.get("reference") == test["expected_reference"]
            )

            actual = f'{result.get("type")} / {result.get("reference")}'

        else:
            result = hymn_search(test["input"])
            results = result.get("results", [])
            first_slug = results[0].get("slug") if results else None

            ok = first_slug == test["expected_slug"]
            actual = f"top={first_slug}, count={len(results)}"

        status = "PASS" if ok else "FAIL"

        if ok:
            passed += 1

        print(f"{status:4} | {test['name']}")
        print(f"       input: {test['input']}")
        print(f"       actual: {actual}")

    except Exception as exc:
        print(f"ERROR | {test['name']}")
        print(f"        {exc}")

    print()

print(f"RESULT: {passed}/{len(tests)} passed")
