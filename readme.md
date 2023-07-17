# ErgoDox EZ Extendable Tent Kit

WIP

This project aims to provide a modular, extendable tilt kit for the ErgoDox EZ.

# Developing
The core directory structure is as follows:
```
➲ tree -d
.
├── components
├── lib
├── parts
└── rendered
```

## Components
`components/` holds all of the shared components that are not aimed to be printed on their own. For instance, posts, hinges, etc, that make up a printable component should be stored here.

## Lib
`lib/` holds common functionality. This could be functions, or modules meant for modifying components like with the `bevel_edge_cutout` module.

## Parts
`parts/` holds parts intended for printing.

## Rendered
`rendered/` holds parts that are rendered to the viewport. Each file in `parts/` should have a corresponding `rendered/` file so that each part can be printed independently. This directory is also intended to hold files that have collections of parts for ease of use. For instance, `main.scad` includes each of the parts required for the core tent kit.

## Files
Some files to take note of include

### `values.scad`
`values.scad` includes all of customizable variables for the kit such as the width, height, and depth of each kit board.

### `rendered/main.scad`
`rendered/main.scad` is where all of the core kit parts should go. Printing the exported STL from this file should produce a full core kit.
