# Coqui XTTS v2 Docker environment
# Tested on Raspberry Pi 4B 8GB (ARM64)
# CPU-only inference

FROM python:3.10-slim

# System dependencies required by TTS
RUN apt-get update && apt-get install -y \
    git \
    espeak-ng \
    ffmpeg \
    build-essential \
    && rm -rf /var/lib/apt/lists/*


# Python build tools
RUN pip install --upgrade pip wheel setuptools==80.9.0


# PyTorch CPU version
# Required for Raspberry Pi / ARM64 compatibility
RUN pip install \
    torch==2.5.1 \
    torchaudio==2.5.1 \
    --index-url https://download.pytorch.org/whl/cpu


# Coqui TTS
RUN pip install TTS


# XTTS v2 compatibility fixes
RUN pip install --force-reinstall \
    "transformers==4.41.2"


# XTTS currently requires NumPy 1.x compatibility
RUN pip install --force-reinstall \
    "numpy<2"


# Installation verification
RUN python - <<EOF
import torch
import numpy
import transformers
import TTS

print("Installation check:")
print("torch:", torch.__version__)
print("cuda available:", torch.cuda.is_available())
print("numpy:", numpy.__version__)
print("transformers:", transformers.__version__)
print("TTS:", TTS.__version__)
EOF
