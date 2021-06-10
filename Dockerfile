FROM ubuntu:latest

LABEL maintainer="matthewluishuerta@gmail.com"

ARG server-pass=pss

ENV TERM=xterm

# prevents errors associated with responses such as "apt-get -y"

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update > /dev/null 

RUN apt-get -y install apt-utils software-properties-common sudo wget unzip tmux > /dev/null 2>&1

RUN useradd -m server_admin

RUN echo "server_admin:$server-pass" | chpasswd

WORKDIR /home/server_admin/

# COPY setup.sh /home/server_admin/

COPY terraria-server-1423.zip /home/server_admin/

RUN unzip terraria-server-1423.zip \ 

&& chown -R server_admin /home/server_admin/  \

&& chmod +x /home/server_admin/1423/Linux/TerrariaServer.bin.x86*
