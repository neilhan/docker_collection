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
