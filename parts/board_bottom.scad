include <../components/board_base.scad>
include <../components/hinge_bottom.scad>

module hinge(mod, depth, hinge_offset) {
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

module board_bottom(width, height, depth, board_radius, slot_radius, slot_offset, hinge_offset) {
    board_base(width, height, depth, board_radius, slot_radius, slot_offset);
    hinge(-1, depth, hinge_offset);
    hinge(1, depth, hinge_offset);
}
