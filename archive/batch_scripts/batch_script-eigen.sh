#!/bin/bash

#SBATCH --mem=2G
#SBATCH --time=09:00:00
#SBATCH -o ./install_log_eigen.txt
#SBATCH -e ./install_log_eigen.txt

echo "Started: $(date)"

. /data/BIDS-HPC/public/software/conda/etc/profile.d/conda.sh
conda activate
conda activate memsurfer2
cd /home/weismanal/notebook/2021-09-08/installing_memsurfer_take_2
MEM_HOME=`pwd`/MemSurfer
module load gcc/7.3.0
export CC_COMPILER=`which gcc`
export CXX_COMPILER=`which g++`
cd MemSurfer/
module load cmake/3.16.4

source /home/weismanal/notebook/2021-09-08/installing_memsurfer_take_2/MemSurfer/load_boost_env.sh

sh install_deps-eigen.sh

echo "Completed: $(date)"
