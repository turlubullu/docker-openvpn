#!/bin/bash

OVPN_DATA="ovpn-data"

docker run --name $OVPN_DATA -v /docker-data/openvpn:/etc/openvpn busybox

docker run --name openvpn --restart=always --volumes-from $OVPN_DATA -d -p 1194:1194/udp --cap-add=NET_ADMIN -e DEBUG=1 kylemanna/openvpn
