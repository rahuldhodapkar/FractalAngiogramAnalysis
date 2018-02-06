#!/usr/bin/env bash

set -e
set -x

INDIR=$1
OUTDIR="proc_"$1
PREFIX=$2

if [ ! -e $OUTDIR ]
then
	mkdir $OUTDIR
fi

# original images are 720x576

for i in `ls $1`;
do
    convert $INDIR/$i \
            -auto-level \
            jpg:-| \
    convert - \
            -canny 0x1+5%+8% \
            jpg:-| \
    convert - \
            -crop 500x500+110+38 \
            $OUTDIR/$PREFIX$i
done