#!/bin/bash

set -ex
PROJECT_ROOT=${PWD}/connectedhomeip
TARGET=$@

if [ -z "$@" ]; then
	echo "Error: please specify platform, e.g. linux"
	exit 1
fi

# [ ! -d $PROJECT_ROOT ] && git clone https://github.com/project-chip/connectedhomeip.git && cd ${PROJECT_ROOT} \
# 	&& ./scripts/checkout_submodules.py --allow-changing-global-git-config --shallow --platform ${TARGET} && source scripts/bootstrap.sh
[ ! -d $PROJECT_ROOT ] && git clone https://github.com/project-chip/connectedhomeip.git && cd ${PROJECT_ROOT} \
	&& ./scripts/checkout_submodules.py --shallow --platform ${TARGET} && source scripts/bootstrap.sh
# git pull
# git submodule update --init
cd ${PROJECT_ROOT} 
source scripts/activate.sh
bash
