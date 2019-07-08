FROM rocker/geospatial

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
     git \
 && install2.r --error \
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
    TMB

ARG INLA_REPO='stable'

RUN Rscript -e "install.packages('INLA', repos=c('https://cloud.r-project.org/', INLA='https://inla.r-inla-download.org/R/$INLA_REPO'), dep=TRUE)" && \
    rm -rf /tmp/*

RUN git clone https://github.com/timcdlucas/INLAutils.git
RUN R CMD build INLAutils
RUN Rscript -e "install.packages('INLAutils', repos = NULL, type = 'source')"
RUN Rscript -e "devtools::install_github('malaria-atlas-project/malariaAtlas', ref = 'dev')"
RUN git clone https://{git_username}:{git_password}@map-fs1.ndph.ox.ac.uk/gitlab/timcdlucas/GBDutils.git
RUN cd GBDutils; git checkout 193565da96468e0a2f0c2c4f840501b5ada40623; cd ..
RUN R CMD build GBDutils
RUN Rscript -e "install.packages('GBDutils', repos = NULL, type = 'source')"

