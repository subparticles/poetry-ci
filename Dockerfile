FROM python:3.11.1

RUN apt-get update && apt-get install -y curl cmake libgl1 libopenblas-dev
RUN curl -sSL https://install.python-poetry.org | python3 - --version 1.6.1
ENV PATH="/root/.local/bin:$PATH"

