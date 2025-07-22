FROM python:3.10-slim

RUN apt-get update && \
    apt-get install -y git ffmpeg espeak-ng && \
    pip install torch torchaudio flask && \
    pip install git+https://github.com/neonbjb/tortoise-tts.git

COPY ./app /app

WORKDIR /app

CMD ["python", "tts_server.py"]
