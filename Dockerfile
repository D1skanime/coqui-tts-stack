FROM python:3.10-slim

RUN apt-get update && \
    apt-get install -y git ffmpeg && \
    pip install TTS==0.22.0

RUN useradd -m tts
USER tts
WORKDIR /home/tts

CMD ["tts-server", "--port", "5002"]