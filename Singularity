BootStrap: shub
From: tpall/singularity-r:4.0.3

%labels
  Maintainer tpall

%help
  This will run rstan

%post
# Install dependencies
  apt-get update -qq \
    && apt-get install -y \
    --no-install-recommends \
    libudunits2-dev \
    libcurl4-openssl-dev \
    libssl-dev \
    libgdal-dev \
    libgsl-dev \
    libnode-dev \
    && Rscript -e "install.packages(c('rstan', 'brms'), dependencies = c('Depends', 'Imports', 'LinkingTo'))" \
    && rm -rf /tmp/downloaded_packages/ /tmp/*.rds
