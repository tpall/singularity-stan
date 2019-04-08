BootStrap: shub
From: tpall/singularity-tidyverse

%labels
  Maintainer tpall

%help
  This will run rstan (and brms) on top of RStudio Server, tidyverse + some other packages

%post
# Install software properties and libudunits2-dev
  apt-get update \
     && apt-get install -y --no-install-recommends libudunits2-dev

# Install rstan  
  install2.r --error --deps TRUE --source TRUE \
     rstan \
     && rm -rf /tmp/downloaded_packages/ /tmp/*.rds

# Install brms
#  install2.r --error --deps TRUE \
#     brms \
#     && rm -rf /tmp/downloaded_packages/ /tmp/*.rds
