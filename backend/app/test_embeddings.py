import time
import torch
import torch.nn.functional as F
from transformers import AutoTokenizer, AutoModel

MODEL_ID = "intfloat/multilingual-e5-small"

print("Loading multilingual embedding model...", flush=True)
started = time.monotonic()

tokenizer = AutoTokenizer.from_pretrained(MODEL_ID)
model = AutoModel.from_pretrained(MODEL_ID)
model.eval()

print(
    "Model loaded in",
    round(time.monotonic() - started, 2),
    "seconds",
    flush=True
)

texts = [
    "query: What is the Mystery of the Incarnation?",
    "query: ምሥጢረ ሥጋዌ ምንድን ነው?",
    "passage: The Mystery of the Incarnation concerns God the Word becoming human.",
    "passage: DNS translates domain names into IP addresses.",
]

def average_pool(last_hidden_states, attention_mask):
    mask = attention_mask.unsqueeze(-1)
    summed = (last_hidden_states * mask).sum(dim=1)
    counts = mask.sum(dim=1).clamp(min=1)
    return summed / counts

started = time.monotonic()

encoded = tokenizer(
    texts,
    padding=True,
    truncation=True,
    max_length=512,
    return_tensors="pt"
)

with torch.inference_mode():
    output = model(**encoded)
    embeddings = average_pool(
        output.last_hidden_state,
        encoded["attention_mask"]
    )
    embeddings = F.normalize(embeddings, p=2, dim=1)

similarity = embeddings @ embeddings.T

print("\n=== EMBEDDING RESULTS ===")
print("Vector dimensions:", embeddings.shape[1])
print("Embedding time:", round(time.monotonic() - started, 2), "seconds")

print("\nEnglish question -> theological passage:",
      round(similarity[0, 2].item(), 4))

print("Amharic question -> theological passage:",
      round(similarity[1, 2].item(), 4))

print("Amharic question -> unrelated DNS passage:",
      round(similarity[1, 3].item(), 4))

print("\nTest completed.")
