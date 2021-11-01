# MemSurfer installation on Biowulf

After [logging in to Biowulf](https://hpc.nih.gov/docs/connect.html) go to `/data` partition of Biowulf (export it to the `$MEMSURFER_INSTALL` variable, e.g., `export MEMSURFER_INSTALL=$(pwd)`), clone this repository. You will likely need to do this on Biowulf or Helix, i.e., not from a compute node, where GitHub access is limited:
export MEMSURFER_INSTALL=$(pwd)

```bash
cd $MEMSURFER_INSTALL
git clone --recursive git@github.com:CBIIT/NCI-DOE-Collab-Pilot2-MemSurfer.git
```

**The order of installation of MemSurfer's dependencies, as well as their versions, is important; these steps should be followed carefully.**

To allocate a compute node for the installation process:

```bash
sinteractive --mem=2g
```

After ensuring the [Miniconda package manager](https://docs.conda.io/en/latest/miniconda.html) is installed, create and activate a `memsurfer` environment:

```bash
conda env create -f environment.yml -n memsurfer
conda activate memsurfer
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

Install the `VTK`, 'boost', `eigen` and `cgal` dependencies:

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
wget https://netactuate.dl.sourceforge.net/project/swig/swig/swig-4.0.2/swig-4.0.2.tar.gz --no-check-certificate
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

## Preinstalled version
Refer to this [README](README-Biowulf_preinstallation.md).
