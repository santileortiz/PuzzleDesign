include <puzzlecad.scad>
include <../common.scad>


$burr_scale = 6;
$plate_width = 143;
$plate_depth = 89;
$burr_inset = 0.07;
$burr_bevel = 0;
$auto_layout = true;

puzzle = [
    //A
    [
        ["x...|xx..|xx.x|xxxx","....|....|...x","....|....|...x","....|....|.xxx|xx"]
    ],
    
    //B
    [
        ["x...|....|....|....","x..x|x..x|x..x|xxxx", "x...|x...|....|.x.."]
    ],
    
    //C
    [
        ["..x.|x.xx|x..x|...x","....|....|x...|xxxx","....|....|x...."]
    ],
    
    //D
    [
        ["x...|x.x.|..x.|.xxx","x...|x...|x...|xx.."]
    ]
];

puzzle_plate(puzzle);

*debug_piece(puzzle, 3);