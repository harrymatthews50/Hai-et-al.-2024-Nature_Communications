FROM rocker/shiny:latest
# require proxy settings for downloading packages behind a proxy,
# comment the following lines if not behind a proxy
ARG http_proxy
ARG https_proxy
RUN apt-get update && apt-get install -y \
    cmake \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    libfontconfig1-dev \
    libfreetype6-dev \
    libpng-dev \
    libtiff5-dev \
    libjpeg-dev \
    && rm -rf /var/lib/apt/lists/* && \
    R -e "install.packages(c('ggplot2','ggpubr','RColorBrewer','Matrix'), repos='http://cran.rstudio.com/', verbose=TRUE)"
# Expose Shiny Server port
EXPOSE 3838