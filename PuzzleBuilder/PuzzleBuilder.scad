// Generation Parameters
include_unit = false;
include_fastener = false;
include_pin = false;
unit_number = 4;

// Dimensions
cube_clearance = 0.07; //mm
cube_size      = 18; //mm

fastener_size           = 6; //mm
fastener_clearance      = 0.05; //mm
fastener_hole_clearance = 0.1; //mm

pin_size           = 2; //mm
pin_clearance      = 0.15; //mm
pin_hole_clearance = 0; //mm


cube_size_actual     = cube_size     - 2*cube_clearance;
fastener_size_actual = fastener_size - 2*fastener_clearance;
pin_size_actual      = pin_size      - 2*pin_clearance;

fastener_hole_actual = fastener_size + 2*fastener_hole_clearance;
pin_hole_actual      = pin_size      + 2*pin_hole_clearance;

wall_size = (cube_size - (2*fastener_size))/3;

module unit_holes(hole_size) {
    // X axis
    translate([0, wall_size/2+fastener_size/2, -wall_size/2-fastener_size/2])
        cube([cube_size + 2, hole_size, hole_size], center=true);

    // Y axis
    translate([-wall_size/2-fastener_size/2, 0, wall_size/2+fastener_size/2])
        cube([hole_size, cube_size + 2, hole_size], center=true);

    // Z axis
    translate([wall_size/2+fastener_size/2, -wall_size/2-fastener_size/2, 0])
        cube([hole_size, hole_size, cube_size + 2], center=true);
}

module unit() {
    difference() {
        cube(cube_size_actual, center = true);

        unit_holes(fastener_hole_actual);
        
        rotate(90, [1, 0, 0]){
            mirror([0,0,1]){
                unit_holes(pin_hole_actual);
            }
        }
    }
}

module fastener_holes(units) {
    for(i=[0:units-1]) {
        translate([-1 + cube_size*i + wall_size + fastener_size/2, 0, 0])
            cube([pin_hole_actual, cube_size, pin_hole_actual], center=true);
        
        translate([cube_size*i + wall_size + fastener_size/2 + fastener_size + wall_size, 0, 0])
            cube([pin_hole_actual, cube_size, pin_hole_actual], center=true);
    }
}

module rod(units, thickness) {
    translate([cube_size/2*units, 0, 0])
        cube([cube_size*units - 2*cube_clearance, thickness, thickness], center=true);
}

module fastener(units) {
    difference() {
        rod(units, fastener_size_actual);
        
        fastener_holes(units);
        
        rotate(90, [1, 0, 0])
            fastener_holes(units);
    }
}

module pin(units) {
    rod(units, pin_size_actual);
}


if (include_unit) {
    translate([cube_size_actual/2, cube_size_actual/2, cube_size_actual/2])
        unit();
}

if (include_fastener) {
    translate([-cube_clearance, fastener_size_actual/2, fastener_size_actual/2])
        fastener(unit_number);
}

if (include_pin) {
    translate([-cube_clearance, pin_size_actual/2, pin_size_actual/2])
        pin(unit_number);
}
