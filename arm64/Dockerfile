FROM rocker/rstudio:latest-daily

## Declares build arguments
#ARG NB_USER
#ARG NB_UID

#COPY --chown=${NB_USER} . ${HOME}

RUN /rocker_scripts/install_geospatial.sh

#USER root
RUN apt-get update && apt-get -y install cron
RUN apt-get update && apt-get -y install jags
RUN apt-get update && apt-get -y install libgd-dev

RUN install2.r devtools remotes arrow
#RUN R -e "Sys.setenv("NOT_CRAN" = TRUE); Sys.setenv("LIBARROW_MINIMAL" = FALSE); Sys.setenv("LIBARROW_BINARY" = FALSE); install.packages('arrow')"
RUN R -e "remotes::install_github(c('eco4cast/EFIstandards','cboettig/aws.s3','rqthomas/cronR','eco4cast/score4cast','eco4cast/neon4cast','cboettig/prov', 'eco4cast/read4cast'))"
#RUN R -e "remotes::install_github('GLEON/rLakeAnalyzer', ref = 'e74974f74082111065bd9cd759527f16608b3c82')"
#RUN R -e "remotes::install_github('aemon-j/gotmtools', ref = 'yaml')"
#RUN R -e "remotes::install_github(c('FLARE-forecast/GLM3r','rqthomas/glmtools','rqthomas/FLAREr','FLARE-forecast/GOTMr','FLARE-forecast/SimstratR','FLARE-forecast/LakeEnsemblR','FLARE-forecast/FLARErLER'))"


RUN install2.r tidyverse renv RNetCDF forecast imputeTS ncdf4 scoringRules tidybayes tidync udunits2 bench contentid yaml RCurl here feasts gsheet

COPY cron.sh /etc/services.d/cron/run
