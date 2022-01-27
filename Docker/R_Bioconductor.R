# Template for installing Bioconductor R packages 

# First install Bioconductor 
install.packages("BiocManager")
library(BiocManager)

# Now install and load Bioconductor packages - add packages as needed using
# same coding as below just change package name in new lines of code 
BiocManager::install("pathview")
