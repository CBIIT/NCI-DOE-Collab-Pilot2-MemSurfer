## MemSurfer

### Description

MemSurfer is an efficient and versatile tool to compute and analyze membrane surfaces found in a wide variety of large-scale molecular simulations. MemSurfer works independently of the type of simulation, directly on the 3D point coordinates, and can handle a variety of membranes as well as atomic simulations. MemSurfer provides many built-in analysis tasks, such as computing the membrane curvature, density and normals of lipids, and area per lipid. More importantly, MemSurfer provides a simple-to-use Python API that researchers can easily use/extend to perform other types of analysis.

MemSurfer is an analysis tool that predates the Joint Design of Advanced Computing Solutions for Cancer (JDACS4C) pilot projects, but Pilot 2 improved and optimized it. Researchers use MemSurfer to perform basic analysis of membrane simulations (such as local area densities) in preparation for creating a macro model from coarse-grained molecular dynamics data.

### User Community

Researchers who want to compute and analyze membrane surfaces or study their properties for large computational jobs such as those carried out by the [JDACS4C Pilot 2 program](https://datascience.cancer.gov/collaborations/joint-design-advanced-computing/molecular-pilot).

### Usability

Requires many software dependencies, even on well-supported high-performance computing systems such as NIH's Biowulf. 

### Uniqueness

MemSurfer allows analysis of membranes that are highly complex and have curved geometries that greatly deviate from a simple planar state, appropriately characterizing the geometric and topological properties of the membrane surface. It works independently of the type of simulation and directly on 3D point coordinates; as a result, MemSurfer can handle a variety of membranes. MemSurfer provides direct access to the membrane surface itself, allowing the user to potentially conceive and compute a variety of nonstandard properties.

### Components and Technical Details

To use the software contained in this GitHub repository, choose one of the following options:
 * If you want to use MemSurfer without installation, you can access the [Preinstalled MemSurfer on Biowulf](README-Biowulf_preinstallation.md). 
 * If you want to modify the code for your purposes, you can (very carefully) install a copy of MemSurfer and external dependencies using [MemSurfer Installation on Biowulf](README-installation.md), based on instructions from Lawrence Livermore National Laboratory (LLNL).  
 
### Example

The [example](/example) directory includes a simple example to test the installation and to demonstrate the functionality of MemSurfer. (The [MemSurfer Installation on Biowulf](README-installation.md) also contains a section on testing the installation process.) The example reads a point set that represents a 2D sinusoidal surface with added noise in z-dimension and generates `*.vtp` files that you can visualize using [Paraview](https://www.paraview.org).

### License

LLNL released MemSurfer under GNU GPL-3.0 license.

For details, refer to [LICENSE](./LICENSE) and [NOTICE](./NOTICE).

LLNL-CODE-763493

### Document Information

Authors: Harsh Bhatia (hbhatia@llnl.gov) and Peer-Timo Bremer

Released: July 22, 2021
