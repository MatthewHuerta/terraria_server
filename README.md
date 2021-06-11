# terraria_server

### DESCRIPTION:

Includes both a docker image and installation script for installing and setting up a terraria server in an Ubuntu 20.40 docker container

___

### REQUIREMENTS:

The host machine is assumed to be any modern Linux Distribution that is running the following packages:

git

Docker version 20.10.2 (or higher)

tmux 3.0a (for installation script)

### MINIMUM HOST-MACHINE SPECS:

2GB RAM (small world)

4GB RAM (large world)

FREE DISK SPACE: 200 MB

CPU SPEED: 2.0 Ghz (Dual Core 3.0 Ghz or higher is recommended)
___

#### INSTALLATION INSTRUCTIONS:

**NOTE** these instructions assume you have already installed and configured docker on the host machine and installed tmux 3.0a

If you have not installed and started the docker service, see https://docs.docker.com/get-docker/

the script also assumes that your user has permissions to run docker without ``sudo``, if it does not, then you may use the following command to add them to the docker group

``sudo usermod -aG docker $USER ``

Installation:

On the machine on which you want to run the server

change directory to desired installation location, and run

``git clone https://github.com/MatthewHuerta/terraria_server && cd terraria_server && ./install.sh ``

This will open a tmux session, and then build and run the docker container, dumping you into the terraria server console upon completion.

After configuring and starting up your server, press ``CTRL + B`` and then ``D`` To detach from the tmux session wthout killing the container process that is running the server.

To reattach to the tmux session and issue commands on the Terraria console, use ``tmux attach``
