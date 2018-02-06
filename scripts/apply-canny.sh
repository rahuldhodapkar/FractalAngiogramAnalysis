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

for i in `ls $1`;
do
    magick convert $INDIR/$i \
            -auto-level jpg:-| \
    magick convert - \
            -canny 0x1+5%+8% \
            $OUTDIR/$PREFIX$i
done