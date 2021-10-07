## MemSurfer README, Version 1.0.1

##### Authors: Harsh Bhatia (hbhatia@llnl.gov) and Peer-Timo Bremer

##### Released: July 22, 2021

### Description:

MemSurfer is an efficient and versatile tool to compute and analyze membrane surfaces found in a wide variety of large-scale molecular simulations. MemSurfer works independent of the type of simulation, directly on the 3D point coordinates, and can handle a variety of membranes as well as atomic simulations. MemSurfer provides many in-built analysis tasks, such as computing the membrane curvature, density and normals of lipids, and area per lipid. More importantly, MemSurfer provides a simple-to-use Python API that researchers can easily use/extend to perform other types of analysis.

MemSurfer is an analysis tool that predates the JDACS4C pilot projects, but Pilot 2 improved and optimized it. Researchers use MemSurfer to perform basic analysis of membrane simulations (such as local area densities) in preparation for creating a macro model from coarse-grained MD data.

### User Community:

Researchers who want to compute and analyze membrane surfaces or study their properties for large computational jobs such as those carried out by the [JDACS4C Pilot 2 program](https://datascience.cancer.gov/collaborations/joint-design-advanced-computing/molecular-pilot).

### Usability:

Requires many software dependencies, even on well-supported HPC systems such as NIH's Biowulf. Follow the instructions in the Technical Details section below very carefully.

### Uniqueness:

MemSurfer allows analysis of membranes that are highly complex and have curved geometries that greatly deviate from a simple planar state, appropriately characterizing the geometric and topological properties of the membrane surface. It works independent of the type of simulation and directly on 3D point coordinates; as a result, MemSurfer can handle a variety of membranes. MemSurfer provides direct access to the membrane surface itself, allowing the user to potentially conceive and compute a variety of nonstandard properties.

### Components:

Software: contained in this GitHub repository as well as external dependencies that you need to set up during installation; see Technical Details below.

### Technical Details:

Here are the steps for [installing MemSurfer on NIH's Biowulf supercomputer](README-installation.md).

### Example:

The `example` directory  includes a simple example to test the installation and to demonstrate the functionality of MemSurfer; see [here](README-installation.md#testing-the-installation) for doing this as part of the installation process. The example reads a point set that represents a 2D sinusoidal surface with added noise in z-dimension and generates `*.vtp` files that you can visualize using [Paraview](https://www.paraview.org).

### License:

LLNL released MemSurfer under GNU GPL-3.0 license.

See [LICENSE](./LICENSE) and [NOTICE](./NOTICE) for details.

LLNL-CODE-763493
