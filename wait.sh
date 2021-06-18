#!/bin/sh

echo "Waiting for mysql..."

while ! nc -z web-db 3606; do
  sleep 0.1
done

echo " mysql started"

exec "$@"
