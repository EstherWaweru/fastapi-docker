# syntax=docker/dockerfile:1
FROM python:3.8-slim-buster

WORKDIR /api

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install system dependencies
RUN apt-get update \
  && apt-get -y install netcat \
  && apt-get clean

COPY requirements.txt requirements.txt

# RUN pip install --upgrade pip
RUN pip3 install -r requirements.txt

COPY . .

# add entrypoint.sh
COPY ./entrypoint.sh .
RUN chmod +x /api/entrypoint.sh

# run entrypoint.sh
ENTRYPOINT ["/api/entrypoint.sh"]
