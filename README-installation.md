# MemSurfer installation on Biowulf

**The order of installation of MemSurfer's dependencies, as well as their versions, is important; follow these steps carefully.**

1. After [logging in to Biowulf](https://hpc.nih.gov/docs/connect.html), allocate a compute node for the installation process:

   ```bash
   sinteractive --mem=2g
   ```

2. After installing the [Miniconda package manager](https://docs.conda.io/en/latest/miniconda.html), create and activate a `memsurfer` environment:

   ```bash
   conda activate
   conda update -n base conda
   conda create -n memsurfer python=3.7.11 numpy six mpi4py Cython=0.29.24 setuptools
   conda activate memsurfer
   ```

3. Export the `/data` partition of Biowulf to the `$MEMSURFER_INSTALL` variable. For example: 

   `export MEMSURFER_INSTALL=$(pwd)`

4. In a folder on that `/data` partition, clone this repository. You will likely need to do this on Biowulf or Helix, i.e., not from a compute node, where GitHub access is limited:

   ```bash
   cd $MEMSURFER_INSTALL
   git clone --recursive git@github.com:CBIIT/NCI-DOE-Collab-Pilot2-MemSurfer.git
   ```

5. Load some dependencies, set some environment variables, and enter the repository:

   ```bash
   module load gcc/7.3.0
   export CC_COMPILER=`which gcc`
   export CXX_COMPILER=`which g++`
   module load cmake/3.16.4
   MEM_HOME=`pwd`/MemSurfer
   cd $MEM_HOME
   ```

6. Install the `VTK` dependency:

   ```bash
   sh install_deps.sh
   ```

7. Install the `boost` dependency:

   a. Make these changes in `install_deps.sh`,

      ```bash
      INSTALL_VTK=false
      INSTALL_BOOST=true
      ```

   b. Run the following command:

      ```bash
      sh install_deps.sh
      ```

   The next two dependencies, `eigen` and `cgal`, depend on this version of `boost`.
   
8. Load the `boost` environment so that it picks up this installation of `boost`:

   a. Source the following script: 

      ```bash
      source $MEMSURFER_INSTALL/MemSurfer/load_boost_env.sh
      ```

   b. Make these changes in `install_deps.sh`,

      ```bash
      INSTALL_BOOST=false
      INSTALL_EIGEN=true
      ```

   c. Install the `eigen` dependency:

      ```bash
      sh install_deps.sh
      ```

9. Install the `cgal` dependency:
   
   a. Make these changes in `install_deps.sh`:

      ```bash
      INSTALL_EIGEN=false
      INSTALL_CGAL=true
      ```

   b. Run:

      ```bash
      sh install_deps.sh
      ```

10. Install a newer version of `swig` than is available on Biowulf:

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

11. Now that you have installed all dependencies, and you can install MemSurfer proper:

    ```bash
    cd $MEM_HOME
    CC=`which gcc` CXX=`which g++` LDCXXSHARED="`which g++` -bundle -undefined dynamic_lookup" python setup.py install
    ```

## Testing the installation

You can test the installation via:

```bash
. $MEMSURFER_INSTALL/MemSurfer/load_memsurfer_env.sh
cd $MEMSURFER_INSTALL/MemSurfer/examples
python ex_simple.py
```
