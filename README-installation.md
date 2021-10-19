# MemSurfer installation on Biowulf

**The order of installation of MemSurfer's dependencies, as well as their versions, is important; these steps should be followed carefully.**

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

In a folder on the `/data` partition of Biowulf (export it to the `$MEMSURFER_INSTALL` variable, e.g., `export MEMSURFER_INSTALL=$(pwd)`), clone this repository. You will likely need to do this on Biowulf or Helix, i.e., not from a compute node, where GitHub access is limited:

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
MEM_HOME=`pwd`/NCI-DOE-Collab-Pilot2-MemSurfer
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

The next two dependencies, `eigen` and `cgal`, depend on this version of `boost`, and to ensure this installation is picked up, you should load the `boost` environment correctly:

```bash
source $MEMSURFER_INSTALL/NCI-DOE-Collab-Pilot2-MemSurfer/load_boost_env.sh
```

make these changes in `install_deps.sh`,

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

Finally, a newer version of `swig` than is available on Biowulf needs to be installed:

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
./configure --prefix=$MEMSURFER_INSTALL/NCI-DOE-Collab-Pilot2-MemSurfer/external2
make
make install
```

Now all dependencies have been correctly installed, and you can install MemSurfer proper:

```bash
cd $MEM_HOME
CC=`which gcc` CXX=`which g++` LDCXXSHARED="`which g++` -bundle -undefined dynamic_lookup" python setup.py install
```

## Testing the installation

The installation can be tested via:

```bash
. $MEMSURFER_INSTALL/NCI-DOE-Collab-Pilot2-MemSurfer/load_memsurfer_env.sh
cd $MEMSURFER_INSTALL/NCI-DOE-Collab-Pilot2-MemSurfer/examples
python ex_simple.py
```
