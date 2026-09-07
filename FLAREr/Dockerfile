FROM rocker/geospatial:4.6

# USER root
RUN apt-get update && apt-get -y install libgd-dev debhelper libmagick++-dev fakeroot

RUN install2.r devtools remotes renv forecast imputeTS scoringRules tidybayes tidync udunits2 RcppRoll
RUN install2.r bench contentid yaml RCurl here feasts gsheet usethis tidymodels rMR
RUN install2.r rstac tidyterra viridis gdalcubes arrow elevatr marmap rLakeAnalyzer jsonlite pacman

RUN R -e "remotes::install_github('FLARE-forecast/FLAREr', ref = 'v3.9.0')"
RUN sleep 180
RUN R -e "remotes::install_github('cboettig/aws.s3')"
RUN sleep 180
RUN R -e "remotes::install_github('eco4cast/score4cast')"
RUN sleep 180
RUN R -e "remotes::install_github('eco4cast/neon4cast')"
RUN sleep 180
RUN R -e "remotes::install_github('usgs-r/glmtools', force = T, upgrade = 'never')"
RUN sleep 180
RUN R -e "remotes::install_github("FLARE-forecast/ropenmeteo", force = T, upgrade = "never")"
RUN sleep 180
RUN R -e "remotes::install_github('flare-forecast/GLMAEDr')"
RUN R -e "GLMAEDr::glm_install()"
RUN R -e "getwd()"
RUN R -e "file.copy(GLMAEDr::glm_path(), '/.')"
