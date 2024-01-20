#!/bin/sh
/usr/sbin/sshd
/usr/sbin/nginx -s reload
/usr/local/websocket-sshd-server/websocket-ssh-server -c /usr/local/websocket-sshd-server/config.yml
