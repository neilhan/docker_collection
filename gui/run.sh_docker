#!/bin/bash

# for volumes, please keep /dev/shm. the rest is your choice. 
# --cap-add=SYS_ADMIN \ ### this gets chrome and firefox working
# --privileged  ### have the same effect, chrome, firefox can run now.
docker run --rm -it \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-e DISPLAY \
	--device /dev/dri \
	--device /dev/snd \
	--device /dev/video0 \
	--device /dev/input \
	-v /etc/localtime:/etc/localtime:ro \
	-v /etc/hosts:/etc/hosts:ro \
	--net=host \
        --user=$USER \
	--volume="/dev/shm:/dev/shm" \
        --volume="$PWD/home:/home" \
        --volume="/home/nhan2/bin:/home/gui/bin" \
        --volume="/home/nhan2/Downloads:/home/gui/Downloads" \
        --volume="/home/nhan2/Projects:/home/gui/Projects" \
        --volume="/home/nhan2/.m2:/home/gui/.m2" \
	--volume="/home/nhan2/.ssh:/home/gui/.ssh" \
	--volume="/home/nhan2/.zshrc:/home/gui/.zshrc" \
	--volume="/home/nhan2/.bashrc:/home/gui/.bashrc" \
	--volume="/home/nhan2/.IdeaIC2017.3:/home/gui/.IdeaIC2017.3" \
        --workdir="/home/gui" \
	--privileged \
	d_gui /usr/bin/bash  # /usr/bin/firefox # chromium-browser

	# -v $HOME/.config/app:/root/.config/app \

# docker run -it \
#     --user=$USER \
#     --env="DISPLAY" \
#     --workdir="/home/$USER" \
#     --volume="/home/nhan2/Projects/docker/dev/home:/home" \
#     --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
#     dev /usr/bin/firefox
