#!/bin/sh
DHPARAMPATH=$1
TARGETPATH=$2
CERTNAME=$(find $DHPARAMPATH -type f -size +1c -print -quit)
if [ -n $CERTNAME ]; then
    echo "moving $CERTNAME to $TARGETPATH ..."
    mv $CERTNAME $TARGETPATH
else
    echo "no dhparam files available :("
    exit 1
fi
