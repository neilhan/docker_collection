#!/bin/bash

# vim setup
echo maybe setup vim plugins
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

nvidia-docker build --rm -t dnn_gui_py3 .
