FROM rocker/geospatial:4.6

# USER root
RUN apt-get update && apt-get -y install libgd-dev debhelper libmagick++-dev fakeroot

RUN install2.r devtools remotes arrow renv RNetCDF forecast imputeTS ncdf4 scoringRules tidybayes tidync udunits2 RcppRoll
RUN install2.r bench contentid yaml RCurl here feasts gsheet usethis tidymodels rMR
RUN sleep 180

RUN R -e "install.packages('xgboost', repos='http://cran.rstudio.com/')"
RUN --mount=type=secret,id=GH_PAT \
    R -e "Sys.setenv(GITHUB_PAT = readLines('/run/secrets/GH_PAT')); remotes::install_github('FLARE-forecast/FLAREr', ref = 'v4.0.3')"
RUN sleep 180
RUN R -e "remotes::install_github('cboettig/aws.s3')"
RUN sleep 180
RUN R -e "remotes::install_github('eco4cast/score4cast')"
RUN sleep 180
RUN R -e "remotes::install_github('eco4cast/neon4cast')"
RUN sleep 180
RUN R -e "remotes::install_github('flare-forecast/GLMAEDr')"
