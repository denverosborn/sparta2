#!/bin/bash

mkdir -pv $HOME/.docker

podman run -it -d \
--name utility \
--restart always \ 
--volume ${HOME}/.docker:/root/.docker:z \
--volume ${HOME}/utility/:/root/utility:z \
--volume ${HOME}/ssh-keys/:/root/.ssh:z \
localhost/utility:latest
