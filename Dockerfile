FROM ubuntu:latest

LABEL maintainer="matthewluishuerta@gmail.com"

# prevents errors associated with responses such as "apt-get -y"

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update > /dev/null

Run apt-get upgrade -y > /dev/null 

RUN apt-get -y install apt-utils > /dev/null 

RUN apt-get -y install sudo > /dev/null

RUN apt-get -y install wget > /dev/null

RUN apt-get -y install curl > /dev/null

RUN apt-get -y install unzip > /dev/null

# RUN apt-get -y install mono* > /dev/null

RUN apt-get -y install tmux > /dev/null

RUN useradd -m -s /bin/bash Steam \

        && usermod -aG sudo Steam \

        && echo "Steam:password" | chpasswd \

USER Steam

WORKDIR /home/Steam/

RUN sudo apt-get -y install lib32gcc1 

RUN curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf - > /dev/null

RUN wget https://terraria.org/system/dedicated_servers/archives/000/000/046/original/terraria-server-1423.zip?1621172068 > /dev/null

RUN unzip terraria-server-1423.zip\?1621172068 > /dev/null

RUN sudo chown -R Steam /home/Steam/ && chmod 755 steamcmd && chmod +x /home/Steam/1423/Linux/TerrariaServer.bin.x86*

EXPOSE 7777

ENTRYPOINT ["/home/Steam/steamcmd"]
