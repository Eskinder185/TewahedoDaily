import torch
import torch.nn.functional as F
from transformers import AutoTokenizer, AutoModel

MODEL_ID = "intfloat/multilingual-e5-small"

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

tokenizer = AutoTokenizer.from_pretrained(MODEL_ID)
model = AutoModel.from_pretrained(MODEL_ID)
model.eval()

def embed(texts):
    encoded = tokenizer(
        texts, padding=True, truncation=True,
        max_length=512, return_tensors="pt"
    )
    with torch.inference_mode():
        output = model(**encoded).last_hidden_state
        mask = encoded["attention_mask"].unsqueeze(-1)
        vectors = (output * mask).sum(1) / mask.sum(1).clamp(min=1)
        return F.normalize(vectors, p=2, dim=1)

passage_vectors = embed(["passage: " + p[1] for p in passages])
question_vectors = embed(["query: " + q[1] for q in questions])

scores = question_vectors @ passage_vectors.T

correct = 0

print("\n=== MULTILINGUAL RETRIEVAL BENCHMARK ===")

for i, (expected, question) in enumerate(questions):
    top = torch.topk(scores[i], k=3)
    results = [
        (passages[j][0], round(float(score), 4))
        for score, j in zip(top.values, top.indices)
    ]

    predicted = results[0][0]
    matched = predicted == expected
    correct += int(matched)

    print("\nQuestion:", question)
    print("Expected:", expected)
    print("Top 3:", results)
    print("Result:", "PASS" if matched else "FAIL")

print("\n================================")
print("Top-1 accuracy:", f"{correct}/{len(questions)}")
print("Accuracy:", f"{correct / len(questions) * 100:.1f}%")
