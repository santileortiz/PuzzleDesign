#!/bin/bash

# Check if the openscad command is available in PATH
if command -v openscad &>/dev/null; then
    OPENSCAD_CMD="openscad"
else
    # If openscad command is not found, use the Flatpak command
    OPENSCAD_CMD="flatpak run --branch=stable --arch=x86_64 --command=openscad --file-forwarding org.openscad.OpenSCAD"
fi

# Generate STL file for Unit module
$OPENSCAD_CMD -o "Unit.stl" -D "include_unit=true;" PuzzleBuilder.scad

# Loop through num_units from 1 to 4
for num_units in {1..4}; do
    # Generate STL files for Fastener module
    $OPENSCAD_CMD -o "Fastener_${num_units}.stl" -D "num_units=$num_units; include_fastener=true;" PuzzleBuilder.scad

    # Generate STL files for Pin module
    $OPENSCAD_CMD -o "Pin_${num_units}.stl" -D "num_units=$num_units; include_pin=true" PuzzleBuilder.scad
done
