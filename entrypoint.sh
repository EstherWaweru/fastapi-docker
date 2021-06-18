#!/bin/sh

echo "Waiting for postgress..."

while ! nc -z db 5432; do
  sleep 0.1
done

echo "Postgress started"

exec "$@"
