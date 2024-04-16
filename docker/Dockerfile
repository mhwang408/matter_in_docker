FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install -y sudo \ 
    git gcc g++ pkg-config libssl-dev libdbus-1-dev \
    libglib2.0-dev libavahi-client-dev ninja-build python3-venv python3-dev \
    python3-pip unzip libgirepository1.0-dev libcairo2-dev libreadline-dev \
    iproute2 iputils-ping \
    && apt clean
COPY env /
RUN . /env && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers \
    && adduser --disabled-password --gecos '' ${USER} \
    && adduser ${USER} sudo \
    && groupmod -g ${GID} ${USER} \
    && usermod -u ${UID} -g ${GID} ${USER} 
RUN git config --global user.email "mh_wang@accton.com"
RUN git config --global user.name "Ming-Hung Wang"
