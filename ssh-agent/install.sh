#!/bin/bash

sudo cp ./ssh-agent.service /etc/systemd/system
sudo systemctl daemon-reload
sudo systemctl enable ssh-agent.service
sudo systemctl start ssh-agent.service
