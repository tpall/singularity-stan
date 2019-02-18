BootStrap: shub
From: tpall/singularity-tidyverse

%labels
  Maintainer tpall

%help
  This will run rstan on top of RStudio Server, tidyverse + some other packages

%post
  apt-get update \
	&& apt-get install -y --no-install-recommends apt-utils ed libnlopt-dev \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/

# Install rstan
  install2.r --error --deps TRUE \
  rstan \
  && rm -rf /tmp/downloaded_packages/ /tmp/*.rds

# Global site-wide config -- needed for building packages
  mkdir -p $HOME/.R/ \
  && echo "CXXFLAGS=-O3 -mtune=native -march=native -Wno-unused-variable -Wno-unused-function -flto -ffat-lto-objects  -Wno-unused-local-typedefs \n" >> $HOME/.R/Makevars

# Config for rstudio user
  mkdir -p $HOME/.R/ \
  && echo "CXXFLAGS=-O3 -mtune=native -march=native -Wno-unused-variable -Wno-unused-function -flto -ffat-lto-objects  -Wno-unused-local-typedefs -Wno-ignored-attributes -Wno-deprecated-declarations\n" >> $HOME/.R/Makevars \
  && echo "rstan::rstan_options(auto_write = TRUE)\n" >> /home/rstudio/.Rprofile \
  && echo "options(mc.cores = parallel::detectCores())\n" >> /home/rstudio/.Rprofile

# Install rstan
  install2.r --error --deps TRUE \
  rstan \
	loo \
	bayesplot \
  rstanarm \
  rstantools \
  shinystan \
  ggmcmc \
  && rm -rf /tmp/downloaded_packages/ /tmp/*.rds
