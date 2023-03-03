FROM rocker/geospatial:4.2.1

# Import GitHub Secret
ARG PAT
RUN echo "My GitHub PAT is $PAT"
ENV PAT=$PAT

## Declares build arguments
#ARG NB_USER
#ARG NB_UID

#COPY --chown=${NB_USER} . ${HOME}

# #USER root
# RUN apt-get update && apt-get -y install cron
# RUN apt-get update && apt-get -y install jags
# RUN apt-get update && apt-get -y install libgd-dev

# #USER ${NB_USER}

# RUN install2.r devtools remotes arrow renv RNetCDF forecast imputeTS ncdf4 scoringRules tidybayes tidync udunits2 bench contentid yaml RCurl here feasts gsheet usethis
RUN R -e "for (i in 1:200) { devtools::install_github('hadley/assertthat', auth_token ='$PAT')}"
RUN R -e "remotes::install_github(c('eco4cast/EFIstandards','rqthomas/cronR','eco4cast/neon4cast','cboettig/prov'), auth_token ='$PAT')"
#'cboettig/aws.s3'
RUN R -e "remotes::install_github(c('FLARE-forecast/GLM3r','rqthomas/glmtools','FLARE-forecast/FLAREr'), auth_token ='$PAT')"
RUN R -e "remotes::install_github('GLEON/rLakeAnalyzer', ref = 'e74974f74082111065bd9cd759527f16608b3c82', auth_token ='$PAT')"
RUN R -e "remotes::install_github('aemon-j/gotmtools', ref = 'yaml', auth_token ='$PAT')"
RUN R -e "remotes::install_github(c('FLARE-forecast/GOTMr','FLARE-forecast/SimstratR','FLARE-forecast/LakeEnsemblR','FLARE-forecast/FLARErLER'), auth_token ='$PAT')"

# COPY cron.sh /etc/services.d/cron/run
