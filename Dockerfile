FROM python:3.10-slim

WORKDIR /workspace

RUN apt-get update && \
    apt-get install -y git && \
    pip install torch==2.1.0 torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu && \
    pip install git+https://github.com/kyutai-labs/unmute.git

CMD ["python3", "app.py", "--model-path", "/workspace/models/unmute-1.6b", "--host", "0.0.0.0", "--port", "5004", "--dtype", "float32"]

