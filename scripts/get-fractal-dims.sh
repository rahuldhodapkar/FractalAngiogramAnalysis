#!/usr/bin/env bash

set -e
set -x

INDIR=$1
OUTFILE=$2

for i in `ls $INDIR`;
do
    ./scripts/fractal-dimension.py $INDIR/$i >> $OUTFILE
done