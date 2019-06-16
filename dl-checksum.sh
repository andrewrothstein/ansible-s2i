#!/usr/bin/env sh
VER=v1.1.14
BUILDHASH=874754de
DIR=~/Downloads
MIRROR=https://github.com/openshift/source-to-image/releases/download

dl()
{
    OS=$1
    PLATFORM=$2
    SUFFIX=$3
    FILE=source-to-image-$VER-$BUILDHASH-$OS-$PLATFORM.$SUFFIX
    DLFILE=$DIR/$FILE
    URL=$MIRROR/$VER/$FILE
    if [ ! -e $DLFILE ]
    then
        wget -q -O $DLFILE $URL
    fi
    printf "  # %s\n  %s-%s: sha256:%s\n" $URL $OS $PLATFORM `sha256sum $DLFILE | awk '{print $1}'`
}

printf "%s-%s:\n" $VER $BUILDHASH
dl darwin amd64 tar.gz
dl linux 386 tar.gz
dl linux amd64 tar.gz
dl windows amd64 zip


