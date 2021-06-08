FROM ubuntu:latest

LABEL maintainer="matthewluishuerta@gmail.com"

# prevents errors associated with responses such as "apt-get -y"

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update > /dev/null

RUN apt-get -y install apt-utils software-properties-common sudo  wget unzip tmux > /dev/null \

        && useradd -m -s /bin/bash Steam \

        && usermod -aG sudo Steam \

        && echo "Steam:password" | chpasswd \

USER Steam

ENV TERM=xterm

WORKDIR /home/Steam/

RUN wget https://terraria.org/system/dedicated_servers/archives/000/000/046/original/terraria-server-1423.zip?1621172068 > /dev/null \

  && unzip terraria-server-1423.zip\?1621172068 > /dev/null \

  && sudo chown -R Steam /home/Steam/  && chmod +x /home/Steam/1423/Linux/TerrariaServer.bin.x86*

EXPOSE 7777
