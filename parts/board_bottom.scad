include <../components/board_base.scad>
include <../components/hinge_bottom.scad>

hinge_offset = 20;

module hinge(mod, depth) {
    translate([
        // Place at the -x edge of the board
        -1 * width / 2 - depth / 2,
        // Place on edges with offset towards the center
        mod * height / 2 + mod * -1 * hinge_offset,
        0
    ])
        rotate([0, 270, 0])
	    hinge_bottom(size=depth);
}

module board_bottom(width, height, depth, board_radius) {
    board_base(width, height, depth, board_radius);
    hinge(-1, depth);
    hinge(1, depth);
}
