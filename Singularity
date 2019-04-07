BootStrap: shub
From: tpall/singularity-tidyverse

%labels
  Maintainer tpall

%help
  This will run rstan and brms on top of RStudio Server, tidyverse + some other packages

%post
# Install software properties and libudunits2-dev
  apt-get update \
     && apt-get install -y --no-install-recommends software-properties-common libudunits2-dev

# Install rstan  
  apt-get update -qq \
     && apt-get install -y --no-install-recommends r-cran-rstan \
     && apt-get clean \
     && rm -rf /var/lib/apt/lists/

# C++ toolchain configuration
  mkdir -p $HOME/.R/ \
     && echo "CXX14FLAGS=-O3 -march=native -mtune=native -fPIC\nCXX14=g++\n" >> $HOME/.R/Makevars

# Install brms
#  install2.r --error --deps TRUE \
#     brms \
#     && rm -rf /tmp/downloaded_packages/ /tmp/*.rds
