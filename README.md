# Estimating the Fractal Dimension of Retinal Angiograms

## Research Goals

This codebase provides a simple toolkit for performing image manipulation (edge
detection filtering etc.) and estimating the fractal dimension of a set of
retinal angiogram images. I hope that this code can act as a template for the
further investigation of branching complexity for other biomedical systems
captured in other imaging modalities.

In the future, I hope that different datasets can be put together and that
additional complexity / structural definition metrics beyond fractal dimension
can be used to analyze vascular networks (and other physical systems).

## Raw Data Source

https://sites.google.com/site/hosseinrabbanikhorasgani/datasets-1/fundus-fluorescein-angiogram-photographs-of-diabetic-patients

Retinal angiograms are presented for 30 normal and 40 abnormal patients. Patients were further classifed by retinopathy type.

## Dependencies

#### ImageMagick++

(base install)

	brew reinstall imagemagick@6 --with-fontconfig --with-librsvg
	brew link --force imagemagick@6

(R installation)

	install.packages('magick')

