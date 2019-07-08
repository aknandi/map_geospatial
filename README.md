rocker/map_geosptial
=============

Docker image for geospatial analysis in R designed for use by the Malaria Atlas Project. Built from rocker/geospatial image (https://github.com/rocker-org/geospatial)

Packages
--------

The packages installed are those used by the Malaria Atlas project for geospatial modelling. Including standard geospatial R packages such as sp and rgdal, data manipulation packages such as readr and data.table, and modelling packages such as TMB and INLA. Some packages in this image are not on CRAN, but installed directly from source (e.g. github). GBDutils is in a private git repository, internal to MAP and so other users cannot access this.

