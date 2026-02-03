FROM python:3.14.2

RUN apt-get update && apt-get install -y curl
RUN curl -sSL https://install.python-poetry.org | python3 - --version 2.3.2
ENV PATH="/root/.local/bin:$PATH"

RUN poetry self add poetry-plugin-export