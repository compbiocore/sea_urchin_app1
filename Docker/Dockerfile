# Base image https://hub.docker.com/u/rocker/
FROM rocker/shiny:latest


# Test the change

# system libraries of general use
## install debian packages
RUN apt-get update -qq && apt-get -y --no-install-recommends install \
    libxml2-dev \
    libcairo2-dev \
    libsqlite3-dev \
    libmariadbd-dev \
    libpq-dev \
    libssh2-1-dev \
    unixodbc-dev \
    libcurl4-openssl-dev \
    libssl-dev

# ## update system libraries
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get clean

# # copy necessary files
RUN mkdir ./rscripts
COPY . /rscripts

# Install R packages from both Bioconductor and CRAN 
RUN Rscript /rscripts/R_Bioconductor.R
RUN Rscript /rscripts/R_CRAN.R

# # expose port
EXPOSE 3838

# # run app on container start
CMD ["R", "-e", "shiny::runApp('/rscripts/MICNMapp/pathway_maps_micnm.R', port = 3838, host = '0.0.0.0')"]
