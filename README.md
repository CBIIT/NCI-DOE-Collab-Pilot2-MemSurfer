## MemSurfer README, Version 1.0.1

##### Authors: Harsh Bhatia (hbhatia@llnl.gov) and Peer-Timo Bremer

##### Released: July 22, 2021

### Description:

MemSurfer is an efficient and versatile tool to compute and analyze membrane surfaces found in a wide variety of large-scale molecular simulations. MemSurfer works independent of the type of simulation, directly on the 3D point coordinates, and can handle a variety of membranes as well as atomic simulations. MemSurfer provides many in-built analysis tasks, such as computing the membrane curvature, density and normals of lipids, and area per lipid. More importantly, MemSurfer provides a simple-to-use Python API that may be easily used/extended to perform other types of analysis.

### User Community:

Researchers who want to compute and analyze membrane surfaces.

### Usability:

Requires many software dependencies, even on well-supported HPC systems such as NIH's Biowulf. The instructions in the Technical Details section below should be followed very carefully.

### Uniqueness:

MemSurfer allows analysis of membranes that are highly complex and have curved geometries that greatly deviate from a simple planar state, appropriately characterizing the geometric and topological properties of the membrane surface. It works independent of the type of simulation and directly on 3D point coordinates; as a result, MemSurfer can handle a variety of membranes. It provides direct access to the membrane surface itself, allowing the user to potentially conceive and compute a variety of nonstandard properties.

### Components:

Software: contained in this GitHub repository as well as external dependencies; see Technical Details below.

### Technical Details:

For a general installation, the [instructions from LLNL should be followed](./ReadMe-LLNL.md), which includes a detailed list of MemSurfer's significant number of dependencies. However, the order of installation of these dependencies, as well as their versions, is important, and overall is a difficult process. We therefore [provide precise steps](README-installation.md) for getting MemSurfer installed on NIH's Biowulf supercomputer.

### Examples:

See the `examples` directory.

### License:

MemSurfer is released under GNU GPL-3.0 license.

See [LICENSE](./LICENSE) and [NOTICE](./NOTICE) for details.

LLNL-CODE-763493
