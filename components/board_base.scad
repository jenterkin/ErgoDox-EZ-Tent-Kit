include <../lib/bevel.scad>

module board_base(width, height, depth, bevel_radius) {
    outer_width = width + (depth * 2);
    outer_height = height + (depth* 2);
    outer_depth = depth;

    difference() {
        cube([width, height, depth], center=true);
        beveled_edge_cutout([width / 2, height / 2, 0], depth, bevel_radius);
        beveled_edge_cutout([width / 2 * -1, height / 2, 0], depth, bevel_radius);
        beveled_edge_cutout([width / 2, height / 2 * -1, 0], depth, bevel_radius);
        beveled_edge_cutout([width / 2 * -1, height / 2 * -1, 0], depth, bevel_radius);
    }
}
