## Preinstalled MemSurfer on Biowulf

After logging in to [Biowulf](https://hpc.nih.gov/docs/connect.html), allocate a compute node for the installation process:

```sinteractive --mem=2g```

## Creating Conda Environment
In case you need to create conda, use the following command:

```conda env create -f environment.yml -n memsurfer```

If not, use the following command to activate the conda environment:

```conda activate memsurfer```

## Setting the Path to the Preinstalled Directory

```MEMSURFER_Path=/data/BIDS-HPC/public/software/Cap_transfer/Pilot2/NCI-DOE-Collab-Pilot2-MemSurfer```

## Loading the Environment
```source $MEMSURFER_Path/load_memsurfer_env.sh

cd $MEMSURFER_Path/example

python ex_simple.py```
