#!/usr/bin/env sh
set -e
DIR=~/Downloads
MIRROR=https://github.com/openshift/source-to-image/releases/download

dl()
{
    local ver=$1
    local build_hash=$2
    local os=$3
    local arch=$4
    local suffix=${5:-tar.gz}
    local platform="${os}-${arch}"
    local file=source-to-image-$ver-$build_hash-$platform.$suffix
    local lfile=$DIR/$file
    local url=$MIRROR/$ver/$file
    if [ ! -e $lfile ]
    then
        wget -q -O $lfile $url
    fi
    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $platform $(sha256sum $lfile | awk '{print $1}')
}

dl_ver() {
    local ver=$1
    local build_hash=$2

    printf "  %s-%s:\n" $ver $build_hash
    dl $ver $build_hash darwin amd64
    dl $ver $build_hash linux 386
    dl $ver $build_hash linux amd64
    dl $ver $build_hash windows amd64 zip
}

dl_ver v1.2.0 2a579ecd

