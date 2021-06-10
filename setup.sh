#!/bin/bash

clear

att() {
    [ -n "${TMUX:-}" ] &&
        tmux switch-client -t '=server' ||
	tmux attach-session -t '=server:=admin_console'
}


echo "choose a password for the server-admin account:"

echo

read -sp 'Password: ' pss

echo

docker image build . --build-arg server-pass=$pss -t terraria_server:1423

unset pss

clear

echo

echo -e "\u001b[31m !! you are in a tmux session; press \"Ctrl + B\" and then \"D\" to detach without killing the docker-container !! \u001b[0m"

echo

docker run -it --user server_admin -p 7777:7777 terraria_server:1423 /home/server_admin/1423/Linux/TerrariaServer.bin.x86_64
