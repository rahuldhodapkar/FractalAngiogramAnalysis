#!/usr/bin/env Rscript

library('fractaldim')
library('imager')

args <- commandArgs(TRUE)

img = load.image(args[1])
imgbin = img > 0.5

datamat = as.matrix(imgbin)
est = fd.estim.transect.incr1(datamat)

stuff = sprintf("%f", est['fd'])
write(stuff, file=args[2], append=TRUE)
