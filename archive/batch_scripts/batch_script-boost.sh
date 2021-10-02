#!/bin/bash

#SBATCH --mem=2G
#SBATCH --time=09:00:00
#SBATCH -o ./install_log_boost.txt
#SBATCH -e ./install_log_boost.txt

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
sh install_deps-boost.sh

echo "Completed: $(date)"
