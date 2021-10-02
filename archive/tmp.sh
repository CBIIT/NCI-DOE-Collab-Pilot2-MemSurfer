#!/bin/bash

source /data/BIDS-HPC/public/software/conda/etc/profile.d/conda.sh
conda activate memsurfer2
MEM_HOME=/home/weismanal/notebook/2021-08-18/installing_memsurfer2/MemSurfer
module load gcc/7.3.0 cmake/3.16.4
export CC_COMPILER=`which gcc`
export CXX_COMPILER=`which g++`
export PYTHONPATH=$MEM_HOME/external/lib/python3.7/site-packages:$PYTHONPATH
export LD_LIBRARY_PATH=$MEM_HOME/external/lib:$MEM_HOME/external/lib64:$LD_LIBRARY_PATH
export BOOST_ROOT=$MEM_HOME/external
export VTK_ROOT=$MEM_HOME/external
export CGAL_ROOT=$MEM_HOME/external
export EIGEN_ROOT=$MEM_HOME/external

export PATH=$MEM_HOME/external2/bin:$PATH
