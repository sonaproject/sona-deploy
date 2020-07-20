#!/bin/bash

ROOT_FILE=/usr/bin/docker-compose
NON_ROOT_FILE=/usr/local/bin/docker-compose

if [[ -f "$ROOT_FILE" ]]; then
	sudo cp ./systemd/root /etc/systemd/system/docker-compose@.service
fi

if [[ -f "$NON_ROOT_FILE" ]]; then
	sudo cp ./systemd/non-root /etc/systemd/system/docker-compose@.service
fi
