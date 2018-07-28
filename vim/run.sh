#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# for volumes, please keep /dev/shm. the rest is your choice. 
# --cap-add=SYS_ADMIN \ ### this gets chrome and firefox working
# --privileged  ### have the same effect, chrome, firefox can run now.
docker run --rm -it \
    --name d_vim \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-e DISPLAY=unix$DISPLAY \
	--device /dev/dri \
	--device /dev/snd \
	--device /dev/video0 \
	--device /dev/input \
	-v /etc/localtime:/etc/localtime:ro \
	-v /etc/hosts:/etc/hosts:ro \
    -v /etc/group:/etc/group:ro -v /etc/passwd:/etc/passwd:ro \
	--net=host \
    -u=$UID:$(id -g $USER) \
	--volume="/dev/shm:/dev/shm" \
    --volume=$HOME/:/home/gui \
    --volume=$DIR/work_dir:/home/gui/.vim \
	--privileged \
	d_vim vim $@

# --user=$USER \
# --workdir="/home/$USER" \
# --volume="$PWD/home:/home" \
