FROM rocker/geospatial:4.4

# USER root
RUN apt-get update && apt-get -y install libgd-dev

RUN install2.r devtools remotes arrow renv RNetCDF forecast imputeTS ncdf4 scoringRules tidybayes tidync udunits2 RcppRoll
RUN install2.r bench contentid yaml RCurl here feasts gsheet usethis tidymodels xgboost rMR
RUN sleep 180
RUN R -e "devtools::install_github('FLARE-forecast/FLAREr', ref = 'v3.0.1')"
RUN sleep 180
RUN R -e "devtools::install_github('cboettig/aws.s3')"
RUN sleep 180
RUN R -e "devtools::install_github('eco4cast/score4cast')"
RUN sleep 180
RUN R -e "devtools::install_github('eco4cast/neon4cast')"
RUN sleep 180
RUN R -e "devtools::install_github('rqthomas/glmtools')"
RUN sleep 180
RUN R -e "devtools::install_github('rqthomas/GLM3r')" 

RUN apt-get install -y libmagick++-dev
