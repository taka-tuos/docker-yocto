#!/bin/bash
sudo docker run -it --rm -u $(id -u):$(id -g) -v $(pwd)/work:/home/user/work -w /home/user/work yocto