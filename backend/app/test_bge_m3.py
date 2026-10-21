import time
import torch
import torch.nn.functional as F
from transformers import AutoTokenizer, AutoModel

MODEL_ID = "BAAI/bge-m3"

passages = [
    ("incarnation", "The Mystery of the Incarnation concerns God the Word becoming human."),
    ("trinity", "The Holy Trinity is one God in three Persons: Father, Son and Holy Spirit."),
    ("baptism", "Baptism is a sacrament associated with spiritual rebirth."),
    ("eucharist", "The Holy Eucharist is the sacrament of communion."),
    ("mary", "The Virgin Mary is called Theotokos, the Mother of God."),
    ("fasting", "Fasting is practiced together with prayer and repentance."),
    ("dns", "DNS translates domain names into IP addresses."),
    ("network", "A router forwards packets between computer networks."),
    ("storage", "RAID combines multiple storage disks."),
    ("linux", "Linux is an operating system used on servers."),
]

questions = [
    ("incarnation", "ምሥጢረ ሥጋዌ ምንድን ነው?"),
    ("trinity", "ሥላሴ ምን ማለት ነው?"),
    ("baptism", "ስለ ጥምቀት ምን ይማራል?"),
    ("eucharist", "ቅዱስ ቁርባን ምንድን ነው?"),
    ("mary", "ድንግል ማርያም ለምን የእግዚአብሔር እናት ትባላለች?"),
    ("fasting", "ጾም ለምን እንጾማለን?"),
    ("incarnation", "What is the Mystery of the Incarnation?"),
    ("trinity", "Explain the Holy Trinity."),
    ("baptism", "What does baptism mean?"),
    ("eucharist", "Explain Holy Communion."),
]

print("Loading BGE-M3...", flush=True)
start = time.monotonic()

tokenizer = AutoTokenizer.from_pretrained(MODEL_ID)
model = AutoModel.from_pretrained(MODEL_ID)
model.eval()

print("Model loading seconds:", round(time.monotonic() - start, 2))

def embed(texts):
    inputs = tokenizer(
        texts,
        padding=True,
        truncation=True,
        max_length=512,
        return_tensors="pt"
    )

    with torch.inference_mode():
        output = model(**inputs).last_hidden_state[:, 0]
        return F.normalize(output, p=2, dim=1)

start = time.monotonic()

passage_vectors = embed([p[1] for p in passages])
question_vectors = embed([q[1] for q in questions])

scores = question_vectors @ passage_vectors.T

print("Embedding dimensions:", passage_vectors.shape[1])
print("Embedding seconds:", round(time.monotonic() - start, 2))

correct = 0
english_correct = 0
amharic_correct = 0

for i, (expected, question) in enumerate(questions):
    values, indices = torch.topk(scores[i], k=3)

    results = [
        (passages[int(j)][0], round(float(score), 4))
        for score, j in zip(values, indices)
    ]

    matched = results[0][0] == expected
    correct += int(matched)

    if i < 6:
        amharic_correct += int(matched)
    else:
        english_correct += int(matched)

    print("\nQuestion:", question)
    print("Expected:", expected)
    print("Top 3:", results)
    print("Result:", "PASS" if matched else "FAIL")

print("\n=== BGE-M3 RESULTS ===")
print(f"Total accuracy: {correct}/10")
print(f"Amharic: {amharic_correct}/6")
print(f"English: {english_correct}/4")
