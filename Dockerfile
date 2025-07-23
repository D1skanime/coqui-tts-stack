FROM python:3.10-slim

WORKDIR /app

RUN apt-get update && \
    apt-get install -y git ffmpeg && \
    pip install --upgrade pip

# Install VoiceCraft dependencies
COPY app/requirements.txt .
RUN pip install -r requirements.txt

# VoiceCraft Code + CLI
COPY app/ ./