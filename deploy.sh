#!/bin/bash
docker build -f Dockerfile  -t tw-elements-validation-ssr:latest . && docker compose up -d && docker logs -f tw-elements-validation-ssr