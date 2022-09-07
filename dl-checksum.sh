#!/usr/bin/env sh
set -e
DIR=~/Downloads
MIRROR=https://github.com/pulumi/kubespy/releases/download

dl()
{
    local lchecksums=$1
    local ver=$2
    local os=$3
    local arch=$4
    local dotexe=$5
    local archive_type=tar.gz
    local platform="$os-$arch"
    local file="kubespy-v${ver}-${platform}.${archive_type}"
    local url="${MIRROR}/v${ver}/$file"

    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $platform $(grep $file $lchecksums | awk '{print $1}')
}

dlver () {
    local ver=$1
    # https://github.com/pulumi/kubespy/releases/download/v0.6.0/checksums.txt
    local rchecksums="${MIRROR}/v${ver}/checksums.txt"
    local lchecksums="${DIR}/kubespy-${ver}-checksums.txt"

    if [ ! -e $lchecksums ];
    then
        curl -sSLf -o $lchecksums $rchecksums
    fi
    printf "  # %s\n" $rchecksums
    printf "  '%s':\n" $ver
    dl $lchecksums $ver darwin amd64
    dl $lchecksums $ver linux amd64
    dl $lchecksums $ver windows amd64
}

dlver ${1:-0.6.1}
