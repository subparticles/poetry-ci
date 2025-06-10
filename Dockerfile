FROM python:3.11.11

RUN apt-get update && apt-get install -y curl
RUN curl -sSL https://install.python-poetry.org | python3 - --version 1.6.1
ENV PATH="/root/.local/bin:$PATH"

