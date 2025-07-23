import torch
import torchaudio
import soundfile as sf
from voicecraft.inference import load_model, infer_tts

# Konfiguration
device = "cpu"  # oder "cuda" wenn du später eine GPU einbaust
model_path = "/app/models/model.safetensors"
config_path = "/app/models/config.json"
output_path = "/app/output/output.wav"
text_input = "Hallo zusammen! Willkommen bei deinem eigenen VoiceCraft-Server."

# Modell laden
print("Lade Modell...")
model, cfg = load_model(model_path, config_path, device=device)

# Text-zu-Sprache Inferenz
print("Erzeuge Sprache...")
wav_tensor = infer_tts(model, cfg, text_input, device=device)

# Als WAV speichern
wav_tensor = wav_tensor.squeeze().cpu().numpy()
sf.write(output_path, wav_tensor, samplerate=cfg['sample_rate'])
print(f"Datei gespeichert unter: {output_path}")