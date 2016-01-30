#!/bin/bash
device0="/dev/ttyACM0"
device1="/dev/ttyACM1"
IMAGE="atong01/rpi-trst-dev"

if [ -e "$device0" ]
then
    if [ -e "$device1" ]
    then
        echo "Two arduinos connected"
        docker run -it -p 8888:8888 \
            -v $PWD/data:/root/data \
            -v $PWD/trst:/root/trst \
            --device="/dev/ttyACM1:/dev/ttyACM1" \
            --device="/dev/ttyACM0:/dev/ttyACM0" \
            $IMAGE
    else
        echo "One arduino connected"
        docker run -it -p 8888:8888 \
            -v $PWD/data:/root/data \
            -v $PWD/trst:/root/trst \
            --device="/dev/ttyACM0:/dev/ttyACM0" \
            $IMAGE
    fi
else
    echo "No Arduinos connected"
    docker run -it -p 8888:8888 \
        -v $PWD/data:/root/data \
        -v $PWD/trst:/root/trst \
        $IMAGE
fi
