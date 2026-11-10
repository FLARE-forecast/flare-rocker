FROM rocker/geospatial:4.6

# USER root
RUN apt-get update && apt-get -y install libgd-dev debhelper libmagick++-dev fakeroot

RUN git clone https://github.com/AquaticEcoDynamics/AED_Tools.git
RUN cd AED_Tools && ./fetch_sources.sh glm
RUN cd AED_Tools/GLM && git switch ptm_updates
RUN cd AED_Tools/libaed-water && git switch v3.0.1
RUN cd AED_Tools/libaed-api && git switch ptm_updates
RUN cd AED_Tools && ./buld_glm.sh --no-gui
RUN cp AED_Tools/GLM/glm ./

RUN install2.r devtools remotes renv RNetCDF forecast imputeTS ncdf4 scoringRules tidybayes tidync udunits2 RcppRoll
RUN install2.r bench contentid yaml RCurl here feasts gsheet usethis tidymodels rMR

RUN --mount=type=secret,id=GH_PAT \
    R -e "Sys.setenv(GITHUB_PAT = readLines('/run/secrets/GH_PAT')); remotes::install_github('FLARE-forecast/FLAREr_private', ref = 'v4.0.4')"
RUN sleep 180
RUN R -e "remotes::install_github('cboettig/aws.s3')"
RUN sleep 180
RUN R -e "remotes::install_github('eco4cast/score4cast')"
RUN sleep 180
RUN R -e "remotes::install_github('eco4cast/neon4cast')"
RUN sleep 180

#RUN R -e "remotes::install_github('flare-forecast/GLMAEDr')"
#RUN R -e "GLMAEDr::glm_install()"
#RUN R -e "getwd()"
#RUN R -e "file.copy(GLMAEDr::glm_path(), '/.')"
