#!/bin/sh

./bin/ollama serve &

sleep 5

./bin/ollama pull tinyllama

sleep 10

tail -f /dev/null
