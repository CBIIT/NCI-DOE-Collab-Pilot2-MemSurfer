# MemSurfer installation on Biowulf

For a general installation, the [instructions from LLNL should be followed](./ReadMe-LLNL.md). However, the order of installation of these dependencies, as well as their versions, is important, and overall is a difficult process. We therefore provide precise steps here for getting MemSurfer installed on NIH's Biowulf supercomputer.

After [logging in to Biowulf](https://hpc.nih.gov/docs/connect.html), allocate a compute node for the installation process:

```bash
sinteractive --mem=2g
```

After ensuring the [Miniconda package manager](https://docs.conda.io/en/latest/miniconda.html) is installed, create and activate a `memsurfer` environment:

```bash
conda activate
conda update -n base conda
conda create -n memsurfer python=3.7.11 numpy six mpi4py Cython=0.29.24 setuptools
conda activate memsurfer
```

In a folder on the `/data` partition of Biowulf (call it `$MEMSURFER_INSTALL`), clone this repository. You will likely need to do this on Biowulf or Helix, i.e., not from a compute node, where GitHub access is limited:

```bash
cd $MEMSURFER_INSTALL
git clone --recursive git@github.com:CBIIT/NCI-DOE-Collab-Pilot2-MemSurfer.git
```

Load some dependencies, set some environment variables, and enter the repository:

```bash
module load gcc/7.3.0
export CC_COMPILER=`which gcc`
export CXX_COMPILER=`which g++`
module load cmake/3.16.4
MEM_HOME=`pwd`/MemSurfer
cd $MEM_HOME
```

Install the `VTK` dependency:

```bash
sh install_deps.sh
```

Install the `boost` dependency by making these changes in `install_deps.sh`,

```bash
INSTALL_VTK=false
INSTALL_BOOST=true
```

and then running:

```bash
sh install_deps.sh
```

The next two dependencies, `eigen` and `cgal`, depend on this version of `boost`, and to ensure this installation is picked up, you should load the `boost` environment correctly. Place the following into a file called `$MEMSURFER_INSTALL/MemSurfer/load_boost_env.sh`:

```bash
#!/bin/bash
BOOST_HOME="$MEMSURFER_INSTALL/MemSurfer/external"
BOOSTLIB="$BOOST_HOME/lib"
BOOSTINC="$BOOST_HOME/include"
export BOOSTLIB=$BOOSTLIB
export LIBRARY_PATH="$BOOSTLIB:$LIBRARY_PATH"
export LD_LIBRARY_PATH="$BOOSTLIB:$LD_LIBRARY_PATH"
export LD_RUN_PATH="$BOOSTLIB:$LD_RUN_PATH"
export CMAKE_LIBRARY_PATH="$BOOSTLIB:$CMAKE_LIBRARY_PATH"
export CMAKE_INCLUDE_PATH="$BOOSTINC:$CMAKE_INCLUDE_PATH"
export CPATH="$BOOSTINC:$CPATH"
```

where you have correctly exported the value of `$MEMSURFER_INSTALL` so that this script works (see `[load_boost_env.sh](./load_boost_env.sh)` in this directory for an example).

Now source this script,

```bash
source $MEMSURFER_INSTALL/MemSurfer/load_boost_env.sh
```

make these changes in `install_deps.sh`:

```bash
INSTALL_BOOST=false
INSTALL_EIGEN=true
```

and install the `eigen` dependency:

```bash
sh install_deps.sh
```

Do the same to install the `cgal` dependency; make these changes in `install_deps.sh`:

```bash
INSTALL_EIGEN=false
INSTALL_CGAL=true
```

and run:

```bash
sh install_deps.sh
```

Now create a MemSurfer environment file `$MEMSURFER_INSTALL/MemSurfer/load_memsurfer_env.sh` with the contents:

```bash
#!/bin/bash
conda activate memsurfer
MEM_HOME=$MEMSURFER_INSTALL/MemSurfer
module load gcc/7.3.0 cmake/3.16.4
export CC_COMPILER=`which gcc`
export CXX_COMPILER=`which g++`
export PYTHONPATH=$MEM_HOME/external/lib/python3.7/site-packages:$PYTHONPATH
export LD_LIBRARY_PATH=$MEM_HOME/external/lib:$MEM_HOME/external/lib64:$LD_LIBRARY_PATH
export BOOST_ROOT=$MEM_HOME/external
export VTK_ROOT=$MEM_HOME/external
export CGAL_ROOT=$MEM_HOME/external
export EIGEN_ROOT=$MEM_HOME/external
source $MEM_HOME/load_boost_env.sh
export PATH=$MEM_HOME/external2/bin:$PATH
```

where again `$MEMSURFER_INSTALL` has been exported correctly; see [load_memsurfer_env.sh](./load_memsurfer_env.sh) for an example.

Finally, at least on Biowulf, a newer, correct version of `swig` needs to be installed:

```bash
source load_memsurfer_env.sh
cd $MEM_HOME
mkdir external2
cd !!:1
mkdir downloads
cd !!:1
wget https://netactuate.dl.sourceforge.net/project/swig/swig/swig-4.0.2/swig-4.0.2.tar.gz
tar -xvf swig-4.0.2.tar.gz
cd swig-4.0.2
./configure --prefix=$MEMSURFER_INSTALL/MemSurfer/external2
make
make install
```

Now all dependencies have been correctly installed, and you can install MemSurfer proper:

```bash
cd $MEM_HOME
CC=`which gcc` CXX=`which g++` LDCXXSHARED="`which g++` -bundle -undefined dynamic_lookup" python setup.py install
```

As discussed further in the [examples](./examples) directory, the installation can be tested via:

```bash
. $MEMSURFER_INSTALL/MemSurfer/load_memsurfer_env.sh
cd $MEMSURFER_INSTALL/MemSurfer/examples
python ex_simple.py
```
