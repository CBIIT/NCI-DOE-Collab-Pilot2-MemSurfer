## Preinstalled MemSurfer on Biowulf

After logging in to [Biowulf](https://hpc.nih.gov/docs/connect.html) allocate a compute node for the installation process:

sinteractive --mem=2g

MEMSURFER_Path=/data/BIDS-HPC/public/software/Cap_transfer/Pilot2/NCI-DOE-Collab-Pilot2-MemSurfer

sh $MEMSURFER_Path/load_memsurfer_env.sh

cd $MEMSURFER_Path/examples

python ex_simple.py
