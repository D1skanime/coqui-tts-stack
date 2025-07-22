FROM python:3.10-slim

RUN apt-get update && \
    apt-get install -y git ffmpeg && \
    pip install TTS==0.22.0

#RUN useradd -m tts
#USER tts
WORKDIR /home/tts

CMD ["tts-server", "--model_name", "tts_models/de/thorsten/tacotron2-DDC", "--vocoder_name", "vocoder_models/de/thorsten/fullband-melgan", "--port", "5002"]