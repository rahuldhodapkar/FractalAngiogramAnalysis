#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# -----------------------------------------------------------------------------
# From https://en.wikipedia.org/wiki/Minkowski–Bouligand_dimension:
#
# In fractal geometry, the Minkowski–Bouligand dimension, also known as
# Minkowski dimension or box-counting dimension, is a way of determining the
# fractal dimension of a set S in a Euclidean space Rn, or more generally in a
# metric space (X, d).
# -----------------------------------------------------------------------------
import scipy.misc
import numpy as np
import sys
 
def fractal_dimension(Z, threshold=0.9):
 
    # Only for 2d image
    assert(len(Z.shape) == 2)
 
    def boxcount(Z, k):
        S = np.add.reduceat(
            np.add.reduceat(Z, np.arange(0, Z.shape[0], k), axis=0),
                               np.arange(0, Z.shape[1], k), axis=1)
        return np.count_nonzero(S)
 
    # Transform Z into a binary array
    Z = (Z < threshold)
 
    # Minimal dimension of image
    p = min(Z.shape)
 
    # Greatest power of 2 less than or equal to p
    n = 2**np.floor(np.log(p)/np.log(2))
 
    # Extract the exponent
    n = int(np.log(n)/np.log(2))
 
    # Build successive box sizes (from 2**n down to 2**0)
    sizes = 2**np.arange(n, 0, -1)
 
    # Actual box counting with decreasing size
    counts = []
    for size in sizes:
        counts.append(boxcount(Z, size))
 
    # Fit 
    coeffs = np.polyfit(np.log(sizes), np.log(counts), 1)
    return -coeffs[0]
 
# See https://en.wikipedia.org/wiki/Sierpinski_triangle to get one image
I = scipy.misc.imread(sys.argv[1])/256.0
print(fractal_dimension(I))