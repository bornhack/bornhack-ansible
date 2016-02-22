#!/bin/sh
TARGETDIR=/usr/local/etc/ansible
TMPDIR=/tmp/ansible/
BRANCH=master

UID=$(id -u)
if [ $UID -ne 0 ]; then
        echo "please run with sudo"
        exit 1
fi

echo "cloning branch $BRANCH into $TMPDIR ..."
rm -rf $TMPDIR
git clone github.com:tykling/bornhack-ansible -b $BRANCH $TMPDIR
if [ $? -ne 0 ]; then
        echo "error cloning from git"
        exit 1
fi
cd $TMPDIR
REV=$(git rev-parse HEAD)
rm -rf $TARGETDIR
mv $TMPDIR/deploy.sh /root/deploy.sh
mv $TMPDIR $TARGETDIR
echo "New bornhack ansible was put into production, revision https://github.com/tykling/bornhack-ansible/commit/${REV}" | mail -s "new bornhack ansible put in production" thomas@gibfest.dk
