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
RUN R -e "for (i in 1:300) { devtools::install_github('hadley/assertthat', force = TRUE) }"
RUN R -e "devtools::install_github('eco4cast/EFIstandards', auth_token ='$PAT')"
RUN R -e "devtools::install_github('eco4cast/neon4cast', auth_token ='$PAT')"
RUN R -e "devtools::install_github('rqthomas/cronR', auth_token ='$PAT')"
RUN R -e "devtools::install_github('rqthomas/glmtools', auth_token ='$PAT')"
RUN R -e "devtools::install_github('FLARE-forecast/GLM3r', auth_token ='$PAT')"
RUN R -e "devtools::install_github('FLARE-forecast/FLAREr', auth_token ='$PAT')"
RUN R -e "devtools::install_github('FLARE-forecast/GOTMr', auth_token ='$PAT')"
RUN R -e "devtools::install_github('FLARE-forecast/SimstratR', auth_token ='$PAT')"
RUN R -e "devtools::install_github('FLARE-forecast/LakeEnsemblR', auth_token ='$PAT')"
RUN R -e "devtools::install_github('FLARE-forecast/FLARErLER', auth_token ='$PAT')"
RUN R -e "devtools::install_github('aemon-j/gotmtools', ref = 'yaml', auth_token ='$PAT')"
RUN R -e "devtools::install_github('GLEON/rLakeAnalyzer', ref = 'e74974f74082111065bd9cd759527f16608b3c82', auth_token ='$PAT')"

# COPY cron.sh /etc/services.d/cron/run
