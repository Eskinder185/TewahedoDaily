import torch
import torchaudio
from transformers import AutoProcessor, AutoModelForCTC

MODEL_ID = "badrex/Ethio-ASR-amharic"
AUDIO_FILE = "/app/sample1.m4a"

print("Loading processor...")
processor = AutoProcessor.from_pretrained(MODEL_ID)

print("Loading model...")
model = AutoModelForCTC.from_pretrained(MODEL_ID)
model.eval()

print("Loading audio...")
waveform, sample_rate = torchaudio.load(AUDIO_FILE)

if waveform.shape[0] > 1:
    waveform = waveform.mean(dim=0, keepdim=True)

if sample_rate != 16000:
    waveform = torchaudio.functional.resample(
        waveform,
        sample_rate,
        16000
    )
    sample_rate = 16000

audio = waveform.squeeze().numpy()

inputs = processor(
    audio,
    sampling_rate=sample_rate,
    return_tensors="pt"
)

print("Transcribing...")

with torch.no_grad():
    logits = model(**inputs).logits

predicted_ids = torch.argmax(logits, dim=-1)

text = processor.batch_decode(predicted_ids)[0]

print()
print("ETHIO-ASR RESULT:")
print(text)
