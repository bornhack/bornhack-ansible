#!/bin/sh
DHPARAMPATH=$1
TARGETPATH=$2
CERTNAME=$(find $DHPARAMPATH -type f -print -quit)
if [ -n $CERTNAME ]; then
    echo "moving $CERTNAME to $TARGETPATH ..."
    mv $CERTNAME $TARGETPATH
else
    echo "no dhparam files available :("
fi
