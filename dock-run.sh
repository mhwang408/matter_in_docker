#!/bin/bash -ex
DATE=`date -I`
tag=$(echo ${PWD} | tr / - | cut -b2- | tr A-Z a-z)
name=$tag-$DATE
params="-u"$(id -u)" \
	-v ${PWD}:${PWD} \
	-v $HOME/.gitconfig:$HOME/.gitconfig:ro \
	-v $HOME/.cache:$HOME/.cache \
	-v $HOME/.cipd-cache-dir:$HOME/.cipd-cache-dir \
	-v $HOME/.local:$HOME/.local\
	-v /var/run/dbus/system_bus_socket:/var/run/dbus/system_bus_socket \
	-v /run/dbus/system_bus_socket:/run/dbus/system_bus_socket \
	-v /dev:/dev \
	--cap-add=NET_ADMIN \
	--cap-add=NET_RAW \
	--privileged \
	-w ${PWD} --ipc=host --net=host --name=${name} -ti ${name}"

docker build --tag=${name} docker

# docker run -v $(readlink -f .):$DEV_PATH -v /var/run/dbus/:/var/run/dbus/:z --cap-add=SYS_ADMIN --cap-add=NET_ADMIN --cap-add=NET_BIND_SERVICE --net=host --privileged --name $DEV_NAME -w $DEV_PATH -tid debian:bookworm bash -c "${DEV_USER}"

docker run $params $@
