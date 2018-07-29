#!/bin/bash

function test {
    echo "test function."
}

function set_xhost_ip {
    ip=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
    if [ -z ip ]; then
        ip=$(ifconfig utun1 | grep inet | awk '$1=="inet" {print $2}')
    fi
    xhost + $ip
    export ip=$ip
}

function build_image {
    image_name=$1
    build_new=$2
    echo ===============================
    echo building $image_name
    echo ===============================

    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

    mkdir -p $DIR/$image_name/container_scripts/model
    cp -r $DIR/../invoice-extraction-model/src $DIR/$image_name/
    cp -r $DIR/container_scripts $DIR/$image_name/
    cp $DIR/../model/invoice_net_for_java.zip $DIR/$image_name/container_scripts/model/
    cp $DIR/../invoice-extraction-service/target/invoice-extraction-service.jar $DIR/$image_name/container_scripts/
    cp $DIR/../pdf-text-extraction/target/pdf-text-extraction.jar $DIR/$image_name/container_scripts/
    cp $DIR/../pdf-text-extraction-spark/target/pdf-text-extraction-spark.jar $DIR/$image_name/container_scripts/
    cp $DIR/../invoice-extraction-model/target/ie-model-src.zip $DIR/$image_name/container_scripts/

    if [ "$build_new" = "new" ]; then
        echo reset docker image
        opt="--no-cache"
    fi

    docker build $opt -t $image_name $DIR/$image_name
    docker tag $image_name docker.artifactory.a.intuit.com/cloud/cloud_ops/iat/$image_name:latest

}

docker_cmd=$(which nvidia-docker)
if [ -f $docker_cmd ]; then
    docker_cmd=$(which docker)
fi
export docker_cmd=$docker_cmd

export docker_common_options_mac="
        -v /tmp/.X11-unix:/tmp/.X11-unix 
        -e DISPLAY=$ip:0 
        --device /dev/dri 
        --device /dev/snd 
        --device /dev/video0 
        --device /dev/input 
        -v $DIR/container/timezone:/etc/timezone 
        -v /etc/hosts:/etc/hosts:ro 
        -v /etc/group:/etc/group:ro -v /etc/passwd:/etc/passwd:ro 
        -v /dev/shm:/dev/shm 
        -u=$UID:$(id -g $USER) 
        --privileged 
        --workdir=$HOME 
	-e HOME=$HOME 
	-v $HOME:$HOME 
        -v $DIR/container:$HOME/.vim 
	-v $DIR/container/vimrc:$HOME/.vimrc 
	-v $DIR/container/gvimrc:$HOME/.gvimrc 
	-v $DIR/container/zshrc:$HOME/.zshrc "

export docker_common_options="
        -v /tmp/.X11-unix:/tmp/.X11-unix 
        -e DISPLAY=unix$DISPLAY 
        --device /dev/dri 
        --device /dev/snd 
        --device /dev/video0 
        --device /dev/input 
        -v /etc/localtime:/etc/localtime:ro 
        -v /etc/hosts:/etc/hosts:ro 
        -v /etc/group:/etc/group:ro -v /etc/passwd:/etc/passwd:ro 
        -v /dev/shm:/dev/shm 
        -u=$UID:$(id -g $USER) 
        --privileged 
        --workdir=$HOME 
	-e HOME=$HOME 
	-v $HOME:$HOME 
        -v $DIR/container:$HOME/.vim 
	-v $DIR/container/vimrc:$HOME/.vimrc 
	-v $DIR/container/gvimrc:$HOME/.gvimrc 
	-v $DIR/container/zshrc:$HOME/.zshrc "

