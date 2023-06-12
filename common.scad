// Flattens one level of nested lists
function flatten_list(lst) = [ for (item = lst) each item ];

// Takes a puzzlecad string representation of a puzzle piece, returns the size
// along the X axis.
function sizeX(piece) =
    max([for (layer = piece) each len(search("|", layer, 0)[0]) + 1]);

// Takes an array of pieces in puzzle cad notation, then sorts them in
// decreasing order of their size along the X axis. Because puzzlecad's
// positioning is based on the order of the arry passed to the burr_plate
// function, this would compact rows of the same height, unless
// $auto_layout=true because then the auto orienting will make the value
// returned by sizeX() not match the actual X axis of the piece.
function sortX(pieces) = !(len(pieces)>0) ? [] : let(
    pivot   = pieces[floor(len(pieces)/2)],
    lesser  = [ for (y = pieces) if (sizeX(y)  < sizeX(pivot)) y ],
    equal   = [ for (y = pieces) if (sizeX(y) == sizeX(pivot)) y ],
    greater = [ for (y = pieces) if (sizeX(y)  > sizeX(pivot)) y ]
) concat(
    sortX(greater), equal, sortX(lesser)
);

// This is a placement function used by puzzle_plate() I intended to make more
// transformations like sortX(), but that wasn't very useful in the end. Maybe
// remove this?.
function place(pieces) = flatten_list(pieces);

// This module creates all puzzle pieces. It expects an array of pieces where
// each piece is itself an array of either one or two arrays, the first one is
// the piece without any connectors and the second one is a dissected piece
// ready for printing. If $auto_layout=true this prints all pieces in their
// connector version, otherwise it renders the full pieces (probably
// unprintaple withoput supports).
module puzzle_plate(puzzle, next_joint_letter=0) {
    if (!$auto_layout) {
        burr_plate([for (piece = puzzle) piece[0]]);
    } else {
        burr_plate(place([for (piece = puzzle) len(piece) == 2 ? piece[1] : [piece[0]]]));
    }
}

// Given a puzzle in the same format used for puzzle_plate() and a piece index,
// this renders the piece both in the full form and dissected one. It's useful
// to debug and check that the dissection is correct and actually assembles to
// the intended piece.
module debug_piece(puzzle, piece) {
    burr_plate([puzzle[piece][0]], $auto_layout = false);
    
    translate([0, $burr_scale*(sizeX(puzzle[piece][0]) + 1), 0])
    if (len(puzzle[piece]) > 1) {
        burr_plate(puzzle[piece][1], $auto_layout = true);
    } else {
        burr_plate([puzzle[piece][0]], $auto_layout = true);
    }
}
