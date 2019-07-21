#!/bin/bash
docker build -t gui .
docker tag gui cgineilhan/gui
docker push cgineilhan/gui:latest
