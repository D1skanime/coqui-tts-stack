FROM python:3.10-slim

WORKDIR /workspace

# Install system dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    git \
    build-essential \
    libsndfile1 \
    libgl1 \
    && rm -rf /var/lib/apt/lists/*

# Install PyTorch CPU Version
RUN pip install --no-cache-dir torch==2.1.0 torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu

# Install unmute TTS
RUN pip install --no-cache-dir git+https://github.com/kyutai-labs/unmute.git

# Standard command
CMD ["python3", "app.py", "--model-path", "/workspace/models", "--host", "0.0.0.0", "--port", "5004", "--dtype", "float32"]
