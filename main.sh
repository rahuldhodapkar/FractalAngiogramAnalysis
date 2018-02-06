#!/usr/bin/env bash
#
# Full analysis pipeline to be run from scratch. All command line dependencies
# must be installed prior to run.
#
# Usage:
#
#		./main.sh
#
# @author rahuldhodapkar
# @version 2018-02-05

set -e
set -x

CASE_DIR=case_raw
CTRL_DIR=ctrl_raw

# Clean up previous run
rm edge_$CASE_DIR edge_$CTRL_DIR || true

# Apply image filtering for edge detection
./scripts/apply-canny.sh $CASE_DIR "edge_"
./scripts/apply-canny.sh $CTRL_DIR "edge_"

# Calculate fractal dimension of filtered images
for i in `ls proc_$CASE_DIR`
do
    ./scripts/est-fractdim-transect.R proc_$CASE_DIR/$i caseout.csv
done

# Calculate fractal dimension of filtered images
for i in `ls proc_$CTRL_DIR`
do
    ./scripts/est-fractdim-transect.R proc_$CTRL_DIR/$i ctrlout.csv
done
