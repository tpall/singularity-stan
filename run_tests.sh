#!/bin/bash

export SINGULARITY_IMAGE="${SINGULARITY_IMAGE:-rstan.simg}"
echo "Using Singularity image: ${SINGULARITY_IMAGE}"

set -e
set -x

# Run rstan 8 school test
singularity exec Rscript test/test_rstan.R

# Run brms test
singularity exec Rscript test/test_brms.R

{ set +x; } 2>/dev/null
echo "All tests passed!"
