BootStrap: shub
From: tpall/singularity-r:3.6.3

%labels
  Maintainer tpall

%help
  This will run rstan

%post
# Install software properties and libudunits2-dev
  apt-get update -qq \
     && apt-get install -y --no-install-recommends libudunits2-dev

# Install rstan  
  install2.r --error --deps TRUE \
    --skipinstalled \
    rstan \
    brms \
    && rm -rf /tmp/downloaded_packages/ /tmp/*.rds
