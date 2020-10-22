#!/bin/bash

export SINGULARITY_IMAGE="${SINGULARITY_IMAGE:-rstan.simg}"
echo "Using Singularity image: ${SINGULARITY_IMAGE}"

set -e
set -x

# Run 8 school test
cd test
singularity exec Rscript 8-schools.R

{ set +x; } 2>/dev/null
echo "All tests passed!"
