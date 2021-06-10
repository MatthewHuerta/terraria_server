#!/bin/bash

tmux new-session -d -s server -n terraria_console

tmux send-keys -t '=server:terraria_console' './setup.sh' Enter

tmux attach-session -t '=server:=terraria_console'




