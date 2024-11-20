# Base image
FROM python:3.10-slim-buster

ENV USERNAME=worker

# Install poetry
RUN apt update && apt install -y gcc libgeos-dev libproj-dev gdal-bin g++ vim
RUN pip install --upgrade pip && pip install poetry

# Create user and set up home directory
RUN useradd --create-home --shell /bin/bash $USERNAME

# Switch to the new user
USER ${USERNAME}
WORKDIR /home/$USERNAME

RUN poetry config virtualenvs.in-project true

RUN echo ""
COPY --chown=worker:worker pyproject.toml ./
RUN poetry install
RUN poetry add pandas
