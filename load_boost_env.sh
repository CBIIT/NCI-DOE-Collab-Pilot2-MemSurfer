#!/bin/bash

# BOOST_HOME="/usr/local/boost/1.76_gcc-4.8.5"
# BOOSTLIB="/usr/local/boost/1.76_gcc-4.8.5/lib"
# BOOSTINC="/usr/local/boost/1.76_gcc-4.8.5/include"
# setenv("BOOSTLIB","$BOOSTLIB")
# prepend_path("LIBRARY_PATH","$BOOSTLIB")
# prepend_path("LD_LIBRARY_PATH","$BOOSTLIB")
# prepend_path("LD_RUN_PATH","$BOOSTLIB")
# prepend_path("CMAKE_LIBRARY_PATH","$BOOSTLIB")
# prepend_path("CMAKE_INCLUDE_PATH","$BOOSTINC")
# prepend_path("CPATH","$BOOSTINC")

BOOST_HOME="/home/weismanal/notebook/2021-09-08/installing_memsurfer_take_2/MemSurfer/external"
BOOSTLIB="$BOOST_HOME/lib"
BOOSTINC="$BOOST_HOME/include"
export BOOSTLIB=$BOOSTLIB
export LIBRARY_PATH="$BOOSTLIB:$LIBRARY_PATH"
export LD_LIBRARY_PATH="$BOOSTLIB:$LD_LIBRARY_PATH"
export LD_RUN_PATH="$BOOSTLIB:$LD_RUN_PATH"
export CMAKE_LIBRARY_PATH="$BOOSTLIB:$CMAKE_LIBRARY_PATH"
export CMAKE_INCLUDE_PATH="$BOOSTINC:$CMAKE_INCLUDE_PATH"
export CPATH="$BOOSTINC:$CPATH"
