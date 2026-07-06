# Set persistent environment variables
# for using an OpenMPI installation.

# Using $HOME because this is accessible on all clusters.
# It is possible to use other shared directories
# if available (e.g. /contrib, /lustre, /bucket)
#
export OPENFOAM_SHARED_DIR=${HOME}/pw/openfoam
mkdir -p $OPENFOAM_SHARED_DIR
#
# Custom shared attached storage:
#export OPENFOAM_SHARED_DIR=/openfoam

#=====================================
# Set container staging location
#=====================================
# Some clusters do not allow access to
# /tmp, the default location for staging
# temporary Singularity files.

# Here, using $OPENFOAM_SHARED_DIR, but you could use other writable paths.
# The default is /tmp but that is not always writeable.
export SINGULARITY_TMPDIR=${OPENFOAM_SHARED_DIR}/.singularity_tmp
export SINGULARITY_CACHEDIR=${OPENFOAM_SHARED_DIR}/.singularity_cache

# singularity pull will fail if these directories do not already exist
# Singularity does automatically make the necessary subdirs.
mkdir -p $SINGULARITY_TMPDIR
mkdir -p $SINGULARITY_CACHEDIR

#=====================================
# Select which MPI to use
# Pick ONE of the lines below
#=====================================
#
# Custom OpenMPI installed locally
# (You will normally need to build it yourself!)
source ${HOME}/mpi-workflows/run_on_cluster/openfoam/openmpi_env.sh
#
# Use this if you install Intel OneAPI directly
# to the system, e.g. sudo yum install intel-hpckit
# source /opt/intel/oneapi/setvars.sh
#
# Use this if you want to use IntelMPI from a
# Spack installation. The path here assumes you
# have already defined a SPACK_ROOT (e.g. in your 
# ~/.bashrc).
# This source line should be already in /etc/bashrc
#source ${SPACK_ROOT}/share/spack/setup-env.sh
# So you already have direct access to MPI in Spack:
#spack load intel-oneapi-mpi

#=====================================
# Specify the configuration of OpenFOAM
#=====================================
source ${HOME}/mpi-workflows/run_on_cluster/openfoam/openfoam_env.sh

# Done!

