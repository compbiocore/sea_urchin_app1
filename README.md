# sea_urchin_app1

This repository contains the necessary files for building a Docker container that launches a R shiny app for visualizing pathways with metabolomics and proteomics. The container uses a micromere versus non-micromere dataset. 

## To build the docker image

Git clone this repo and then `cd` into the Docker folder where the Dockerfile and all associated files are located. Then do a docker build using the following: 

`docker build . -t <name of image>` 

## Launch app 

Once docker image has been successfully built, run the following: 

`docker run -p 3838:3838 <name of image>`

## Navigating to website 
Once launched, you can navigate to the website by locating the host site given in the terminal. It should look something like this: 

Listening on http://0.0.0.0:3838

Copy and paste the http part of the code line into your web browser and you are all set! 





