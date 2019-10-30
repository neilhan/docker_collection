#!/bin/bash
docker build --no-cache \
       --build-arg USER_NAME=appuser \
       --build-arg USER_ID=$(id -u) \
       --build-arg GROUP_NAME=appuser \
       --build-arg GROUP_ID=$(id -g) \
       -t python2_local $opt .
# docker build -t gui .
# docker tag gui cgineilhan/gui
# docker push cgineilhan/gui:latest
