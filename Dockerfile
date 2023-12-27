# Base image
FROM python:3.10-slim-buster

ENV USERNAME=worker

# Install poetry
RUN apt update && apt install -y gcc libgeos-dev libproj-dev gdal-bin g++ vim
RUN pip install --upgrade pip && pip install poetry

RUN useradd work && mkdir /home/work && chown work:work /home/work && :

RUN poetry config virtualenvs.in-project true

RUN useradd --shell /bin/bash --create-home $USERNAME

USER ${USERNAME}
WORKDIR /home/$USERNAME

COPY pyproject.toml poetry.lock ./
RUN poetry install