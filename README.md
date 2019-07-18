rocker/map_geospatial
=============

[![Build Status](https://travis-ci.org/aknandi/map_geospatial.svg)](https://travis-ci.org/aknandi/map_geospatial)

Docker image for geospatial analysis in R designed for use by the Malaria Atlas Project. Built from rocker/verse (https://hub.docker.com/r/rocker/verse).

Current image is using rocker v3.6.0

Build package
-------------

This dockerfile contains a private git repository called GBDutils in the Malaria Atlas Project GitLab account. It you are in MAP use your GitLab username and password as build arguments:

    docker build --build-arg git_username=my_username --build-arg git_password=my_password

If you do not have a MAP GitLab you do not have access to the GBDutils package. In order to build the package you will have to comment out the last 4 lines containing GBDutils and build without arguments. The image you create will contain all the packages apart from GBDutils:

    docker build .

Packages
--------

The packages installed are those used by the Malaria Atlas Project (MAP) for geospatial modelling. Including standard geospatial R packages such as sp and rgdal, data manipulation packages such as readr and data.table, and modelling packages such as TMB and INLA. Some packages in this image are not on CRAN, but installed directly from source (e.g. github). GBDutils is in a private git repository, internal to MAP and so other users cannot access this.

