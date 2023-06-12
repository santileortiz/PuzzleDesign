include <puzzlecad.scad>
include <../common.scad>


$burr_scale = 7.5;
$plate_width = 143;
$plate_depth = 89;
$plate_sep = 2;

$burr_inset = 0.07;
$burr_bevel = 0;
$auto_layout = true;


puzzle = [
    //A
    [
        ["xxxx|x..x|x..x|...x","x..x|x...|....|...x","x...|xx..|.x..|.xxx","....|....|....|...x"],
        
        [
            ["xxx{connect=fx+z+,clabel=C}|x..|x..", "x{connect=mz+x+,clabel=A}..|x{connect=mz+x+,clabel=B}..|..."],
            ["x{connect=fz-x+,clabel=A}..|x{connect=fz-x+,clabel=B}x.|.x.|.xx{connect=fx+z-,clabel=D}"],
            ["xx{connect=mz+x+,clabel=D}xx|...x|...x|..xx{connect=mz+x-,clabel=C}"]
        ]
    ],
    
    //B
    [
        ["xx{label_text=Tumbler,label_orient=y-x+,label_hoffset=0.5}xx|x..x|x..x", "x...|x...|x..x", "....|....|x.xx"],
        
        [
            ["xx{label_text=Tumbler,label_orient=y-x+,label_hoffset=0.5}xx|x..x|x..x", "x...|x...|x..x{connect=mz+y+,clabel=G}", "....|....|x..."],
            ["x{connect=fz+y+,clabel=G}x"]
        ]
    ],
    
    //C
    [
        ["xxxx|x..x|x", "....|x...|xx..", "....|x...|...."],
        
        [
            ["xxxx|x{connect=mz+x+,clabel=E}..x|x{connect=mz+x+,clabel=F}..."],
            ["x{connect=fz-x+,clabel=E}.|x{connect=fz-x+,clabel=F}x", "x.."]
        ]
    ],
    
    //D
    [
        ["xxxx|x...", "x...|x...", "....|x..."]
    ],
    
    //E
    [
        ["x..|xxx|...", "...|..x|..x"]
    ],
    
    //F
    [
        ["x.|xx"]
    ],
];

puzzle_plate(puzzle, $auto_layout_initial_clabel = 7);

*debug_piece(puzzle, 1);