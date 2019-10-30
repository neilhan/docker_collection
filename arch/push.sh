#!/bin/bash
# docker build --no-cache -t gui .
# docker build -t gui .
docker tag arch cgineilhan/arch
docker push cgineilhan/arch:latest
