#!/bin/bash

nvidia-docker run --rm -it \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-e DISPLAY=$DISPLAY \
	--device /dev/dri \
	--device /dev/snd \
	--device /dev/video0 \
	--device /dev/input \
	-v /etc/localtime:/etc/localtime:ro \
	-v /etc/hosts:/etc/hosts:ro \
	--net=host \
        --user=gui \
	--volume="/dev/shm:/dev/shm" \
        --volume="$HOME/bin:/home/gui/bin" \
        --volume="$HOME/Downloads:/home/gui/Downloads" \
        --volume="$HOME/Projects:/home/gui/Projects" \
        --volume="$HOME/.m2:/home/gui/.m2" \
        --workdir="/home/gui" \
	--privileged \
	dnn_gui  

