#!/bin/bash
cat > ~/.config/systemd/user/ssh-agent.service <<- EOM
[Unit]
Description=SSH key agent

[Service]
Type=simple
Environment=SSH_AUTH_SOCK=%t/ssh-agent.socket
# DISPLAY required for ssh-askpass to work
Environment=DISPLAY=:0
ExecStart=/usr/bin/ssh-agent -D -a $SSH_AUTH_SOCK

[Install]
WantedBy=default.target
EOM
systemctl --user enable ssh-agent.service
systemctl --user start ssh-agent.service
