FROM rocker/verse:3.6.0
LABEL maintainer="anita.k.nandi@gmail.com"

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    lbzip2 \
    libfftw3-dev \
    libgdal-dev \
    libgeos-dev \
    libgsl0-dev \
    libgl1-mesa-dev \
    libglu1-mesa-dev \
    libhdf4-alt-dev \
    libhdf5-dev \
    libjq-dev \
    liblwgeom-dev \
    libpq-dev \
    libproj-dev \
    libprotobuf-dev \
    libnetcdf-dev \
    libsqlite3-dev \
    libssl-dev \
    libudunits2-dev \
    netcdf-bin \
    postgis \
    protobuf-compiler \
    sqlite3 \
    tk-dev \
    unixodbc-dev \
    git \
  && install2.r --error \
    RColorBrewer \
    classInt \
    gstat \
    mapdata \
    maptools \
    proj4 \
    raster \
    rgdal \
    rgeos \
    rlas \
    sf \
    sp \
    spacetime \
    spatstat \
    geoR \
    geosphere \
    cowplot \
    data.table \
    devtools \
    doParallel \
    getPass \
    ggfortify \
    lubridate \
    readr \
    rgl \
    rmarkdown \
    sparseMVN \
    spatstat \
    spdep \
    tictoc \
    TMB \
    zoo \
    VGAM \
    png \
    rasterVis \
    cvTools \
    boot \
    stringr \
    dismo \
    gbm

ARG INLA_REPO='stable'

RUN Rscript -e "install.packages('INLA', repos=c('https://cloud.r-project.org/', INLA='https://inla.r-inla-download.org/R/$INLA_REPO'), dep=TRUE)" && \
    rm -rf /tmp/*

RUN git clone https://github.com/timcdlucas/INLAutils.git
RUN R CMD build INLAutils
RUN Rscript -e "install.packages('INLAutils', repos = NULL, type = 'source')"
RUN Rscript -e "devtools::install_github('malaria-atlas-project/malariaAtlas', ref = 'dev')"

ARG git_username
ARG git_password

RUN git clone https://${git_username}:${git_password}@map-fs1.ndph.ox.ac.uk/gitlab/timcdlucas/GBDutils.git
RUN cd GBDutils; git checkout 193565da96468e0a2f0c2c4f840501b5ada40623; cd ..
RUN R CMD build GBDutils
RUN Rscript -e "install.packages('GBDutils', repos = NULL, type = 'source')"

