# MemSurfer Installation on Biowulf

**The order of installation of MemSurfer's dependencies, as well as their versions, is important; follow these steps carefully.**

1. Log in to [Biowulf](https://hpc.nih.gov/docs/connect.html). 

2. Go to the `/data` partition of Biowulf. For example: 

   1. Run the following command:
   
      ```cd /data/$USER/export```
   
   2. Export it to the `$MEMSURFER_INSTALL` variable. For example: 
   
      ```export MEMSURFER_INSTALL=$(pwd)```

   Do this on Biowulf or Helix, that is, not from a Biowulf compute node, where GitHub access is limited.
 
3. Clone this repository: 

   ```bash
   cd $MEMSURFER_INSTALL
   git clone --recursive git@github.com:CBIIT/NCI-DOE-Collab-Pilot2-MemSurfer.git
   ```
2. Allocate a compute node for the installation process:

   ```bash
   sinteractive --mem=2g
   ```
3. Install the [Miniconda package manager](https://docs.conda.io/en/latest/miniconda.html), create and activate a `memsurfer` environment:

   ```bash
   conda env create -f environment.yml -n memsurfer
   conda activate memsurfer
   ```

4. Load some dependencies, set some environment variables, and enter the repository:

   ```bash
   module load gcc/7.3.0
   export CC_COMPILER=`which gcc`
   export CXX_COMPILER=`which g++`
   module load cmake/3.16.4
   MEM_HOME=`pwd`/NCI-DOE-Collab-Pilot2-MemSurfer
   cd $MEM_HOME
   ```

5. Install the `VTK`, 'boost', `eigen` and `cgal` dependencies:

   ```bash
   sh install_deps.sh
   ```

6. Load version 4.0.2 of `swig`. This is a newer version than is available on Biowulf:

   ```module load swig/4.0.2```
 
7. Export the `/data/$USER/NCI-DOE-Collab-Pilot2-MemSurfer` partition of Biowulf to the `$MEMSURFER_HOME` variable. For example: 

   `export MEMSURFER_HOME=$(pwd)`


8. Now that you have installed all dependencies, you can install MemSurfer proper:

    ```bash
    cd $MEM_HOME
    CC=`which gcc` CXX=`which g++` LDCXXSHARED="`which g++` -bundle -undefined dynamic_lookup" python setup.py install
    ```

## Testing the Installation

You can test the installation via:

```bash
. $MEMSURFER_INSTALL/NCI-DOE-Collab-Pilot2-MemSurfer/load_memsurfer_env.sh
cd $MEMSURFER_INSTALL/NCI-DOE-Collab-Pilot2-MemSurfer/example
python ex_simple.py
```

If you installed Memsurfer and all dependencies correctly, the example generates `*.vtp` files that you can visualize using [Paraview](https://www.paraview.org).

## Preinstalled version
Refer to this [README](README-Biowulf_preinstallation.md).
