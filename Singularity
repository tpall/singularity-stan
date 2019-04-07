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
	loo \
	bayesplot \
  	rstanarm \
  	rstantools \
  	shinystan \
  	ggmcmc \
  	&& rm -rf /tmp/downloaded_packages/ /tmp/*.rds
