#!/bin/bash

internalIp="$(ip a | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1')"
externalIp="$(dig +short myip.opendns.com @resolver1.opendns.com)"

if [ "$SECRET" = "" ]; then
    SECRET="$(openssl rand -hex 32)"
fi

REALM=${REALM:-stun.mydomain.tld}

echo " "
echo " "
echo "      SECRET: $SECRET"
echo " "
echo " "

echo "
listening-port=3478
fingerprint
# Only on coTURN below v4.5.0.8!
lt-cred-mech 
use-auth-secret
static-auth-secret=$SECRET
realm=$REALM
total-quota=100
bps-capacity=0
stale-nonce
# Only on coTURN below v4.5.1.0!
no-loopback-peers 
no-multicast-peers
" | tee /etc/turnserver.conf

echo "Start TURN server..."

turnserver
