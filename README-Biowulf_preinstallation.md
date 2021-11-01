## Preinstalled MemSurfer on Biowulf

After logging in to [Biowulf](https://hpc.nih.gov/docs/connect.html) allocate a compute node for the installation process:

sinteractive --mem=2g

## Creating Conda environment
conda env create -f environment.yml -n memsurfer

conda activate memsurfer

## Setting the path to the preinstalled directory

MEMSURFER_Path=/data/BIDS-HPC/public/software/Cap_transfer/Pilot2/NCI-DOE-Collab-Pilot2-MemSurfer

## Loading the environment
sh $MEMSURFER_Path/load_memsurfer_env.sh

cd $MEMSURFER_Path/examples

python ex_simple.py
