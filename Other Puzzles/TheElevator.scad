include <puzzlecad.scad>
include <../common.scad>


$burr_scale = 9;
$plate_width = 143;
$plate_depth = 89;
$plate_sep = 2;

$burr_inset = 0.07;
$burr_bevel = 0;
//$joint_inset = 0.015;

$auto_layout = true;


puzzle = [
    //A
    [
        ["xxxx|x..x|x..x|xx.x", "....|....|....|x..x", "....|....|....|xx{label_text=The Elevator,label_orient=y+x-,label_hoffset=-0.5,label_scale=0.3}xx", "....|....|....|...x"],
        
        [
            ["xxxx|x..x|x..x|x{connect=mz+y+,clabel=A}x.x{connect=mz+y+,clabel=B}"],
            ["x{connect=fz-y+,clabel=A}..x{connect=fz-y+,clabel=B}", "xx{label_text=The Elevator,label_orient=y+x-,label_hoffset=-0.5,label_scale=0.3}xx", "...x"]
        ]
    ],
    
    //B
    [
        ["x..x|x..x|xxxx", "x..x|...x|xxxx"]
    ],
    
    //C
    [
        ["xx..x|xxxxx|.....|.....","x....|x...x|x....|x...."],
        
        [
            ["x{connect=fz-x-,clabel=C}|x{connect=mz-x-,clabel=D}|x|x"],
            ["x{connect=mz+x-,clabel=C}x..x|x{connect=fz+x-,clabel=D}xxxx",".....|....x"]
        ]
    ],
    
    //D
    [
        ["x...x|xxxxx|.....", "x...x|x...x|x...."],
        
        [
            ["x{connect=fz-x+,clabel=E}|x{connect=fz-x+,clabel=F}|x"],
            ["x{connect=mz+x+,clabel=E}...x{connect=mz+x+,clabel=G}|x{connect=mz+x+,clabel=F}xxxx{connect=mz+x+,clabel=H}"],
            ["x{connect=fz-x+,clabel=G}|x{connect=fz-x+,clabel=H}"]
        ]
    ],
    
    //E
    [
        [".....|xxxxx|x....", "x....|x...x|x...x"],
        
        [
            ["x|x{connect=fz+x-,clabel=I}|x{connect=fz+x-,clabel=J}"],
            [".....|x{connect=mz+x+,clabel=I}xxxx{connect=mz+x+,clabel=K}|x{connect=mz+x+,clabel=J}...."],
            ["x{connect=fz+x-,clabel=K}|x"]
        ]
    ],
    
    //F
    [
        ["x....|xxxxx", "x....|xx..."]
    ]
];


puzzle_plate(puzzle);

*debug_piece(puzzle, 3);