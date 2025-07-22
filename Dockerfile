FROM python:3.10-slim

RUN apt-get update && \
    apt-get install -y git ffmpeg espeak-ng && \
    pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu && \
    pip install git+https://github.com/neonbjb/tortoise-tts.git

WORKDIR /app
COPY app/tts_server.py .

CMD ["python", "tts_server.py"]