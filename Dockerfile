# Use NVIDIA CUDA 12.8 base image with Ubuntu
FROM nvidia/cuda:12.8.0-cudnn-devel-ubuntu24.04

# Set environment variables for non-interactive installs
ENV DEBIAN_FRONTEND=noninteractive

# Install Python 3.11.3
RUN apt-get update && apt-get install -y \
    software-properties-common \
    && add-apt-repository ppa:deadsnakes/ppa \
    && apt-get update && apt-get install -y \
    python3.11 python3.11-venv python3.11-dev python3-pip \
    && apt-get clean && rm -rf /var/lib/apt/lists/*


RUN apt-get update && apt-get install -y \
    libopenblas-dev \
    build-essential \
    libffi-dev \
    libssl-dev \
    cargo \
    && rm -rf /var/lib/apt/lists/*

# Set Python 3.11 as the default
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.11 1 \
    && update-alternatives --config python3

RUN apt-get update && apt-get install -y curl cmake libgl1 libopenblas-dev cuda-12-8
RUN curl -sSL https://install.python-poetry.org | python3 - --version 1.6.1
ENV PATH="/root/.local/bin:$PATH"

# Verify CUDA and Python versions
RUN python3 --version && nvcc --version

CMD ["python3"]