#!/bin/sh
DHPARAMPATH=$1
OPENSSL=$2
BUFFERCOUNT=$3

while true; do
        for DHPARAM in $(seq 1 $BUFFERCOUNT); do
                CERTNAME=${DHPARAMPATH}$DHPARAM.pem
                if [ ! -s $CERTNAME ]; then
                        echo "$CERTNAME missing, generating..."
                        $OPENSSL dhparam 4096 > $CERTNAME
                fi
        done
        sleep 600
done

