#!/bin/bash
#---------------------
echo "Sourcing environment..."
source main_env.sh

echo "Building container..."
# Container (.sif) is based on defintion file (.def)
if [[ $PW_PLATFORM_HOST == "activate.hpc.mil" && $PW_PROVIDER_NAME == "aws-slurm" ]]; then
    echo "Need to use sandbox build"
    singularity build --fakeroot --sandbox ${OPENFOAM_SHARED_DIR}/openfoam.sif openfoam.def
else
    echo "Building regular container"
    singularity build --fakeroot ${OPENFOAM_SHARED_DIR}/openfoam.sif openfoam.def
fi
echo "Done building container."

