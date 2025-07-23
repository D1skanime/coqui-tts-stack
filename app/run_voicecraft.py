import torch
import torchaudio
from voicecraft.inference import load_model, generate_audio

TEXT = "Hallo. Dies ist ein deutscher Beispielsatz aus einem Buch."
MODEL_PATH = "./models/VoiceCraft_giga830M"
OUTPUT_PATH = "./output/result.wav"

device = "cuda" if torch.cuda.is_available() else "cpu"

# Modell laden
model, processor = load_model(MODEL_PATH, device=device)

# Audio erzeugen
wav = generate_audio(model, processor, TEXT, device=device)

# Speichern
torchaudio.save(OUTPUT_PATH, wav.unsqueeze(0), sample_rate=16000)
print("Gespeichert unter:", OUTPUT_PATH)
