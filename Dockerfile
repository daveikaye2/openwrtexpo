FROM debian:jessie
RUN apt-get update
RUN apt-get install sudo
RUN adduser --disabled-password --gecos '' docker
RUN adduser docker sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER docker
WORKDIR /home/docker
RUN sudo apt-get install -y build-essential libncurses5-dev gawk git libssl-dev gettext unzip zlib1g-dev file python wget
COPY repo ./openwrt
RUN sudo chown -R docker:docker openwrt
WORKDIR /home/docker/openwrt
COPY .config .
RUN ./scripts/feeds update -a
ENTRYPOINT ["make"]