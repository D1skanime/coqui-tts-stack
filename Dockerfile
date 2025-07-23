FROM python:3.10-slim

WORKDIR /app

# Benötigte Systembibliotheken
RUN apt-get update && \
    apt-get install -y git ffmpeg build-essential libsndfile1 curl && \
    pip install --upgrade pip

# Python-Abhängigkeiten
COPY app/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# VoiceCraft Skripte
COPY app/ ./
