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
        --volume="$HOME/.ssh:/home/gui/.ssh" \
        --volume="$HOME/.gitconfig:/home/gui/.gitconfig" \
	--volume="$HOME/.java:/home/gui/.java" \
	--volume="$HOME/.config:/home/gui/.config" \
	--volume="$HOME/.zshrc:/home/gui/.zshrc" \
	--volume="$HOME/.bashrc:/home/gui/.bashrc" \
	--volume="$HOME/.sharedrc:/home/gui/.sharedrc" \
        --volume="$HOME/.PyCharmCE2018.1:/home/gui/.PyCharmCE2018.1" \
	--volume="$HOME/anaconda2/envs:/home/gui/anaconda2/envs" \
        --volume="$HOME/.conda:/home/gui/.conda" \
        --workdir="/home/gui" \
	--privileged \
	dnn_gui  bash



