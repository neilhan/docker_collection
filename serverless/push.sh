#!/bin/bash
# docker build --no-cache -t gui .
# docker build -t gui .
docker tag d_serverless cgineilhan/serverless
docker push cgineilhan/serverless:latest
