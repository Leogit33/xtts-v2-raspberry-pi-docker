# Coqui XTTS v2 on Raspberry Pi

Docker environment for running Coqui XTTS v2 text-to-speech on ARM64 Raspberry Pi systems.

## Tested hardware

- Raspberry Pi 4B
- 8 GB RAM
- Raspberry Pi OS 64-bit

## Features

- Docker-based installation
- XTTS v2 support
- Speaker reference audio support
- Text file rendering
- Batch rendering examples

## Performance

CPU-only rendering on Raspberry Pi 4B (8 GB RAM):

- Approximately 50 minutes for a 9-minute narration.
- Real-time factor: around 58x slower than real time.

- ## Hardware notes

No GPU acceleration was used.

