include <../lib/bevel.scad>
include <../lib/slot.scad>

tolerance = 0.001;

module board_base(width, height, depth, bevel_radius, slot_radius, slot_offset) {
    difference() {
        cube([width, height, depth], center=true);

	// Bevel edges
        beveled_edge_cutout([width / 2 * -1, height / 2, 0], depth, bevel_radius);
        beveled_edge_cutout([width / 2 * -1, height / 2 * -1, 0], depth, bevel_radius);

	// Slots
        left_position = height / 2 - slot_offset;
        right_position = left_position * -1;
        rail_length = width / 2;

        // add slot_radius to x so that slots lay solely on one side of the board
        translate([slot_radius, left_position, 0]) rail_cutout(rail_length, slot_radius);
        translate([slot_radius, right_position, 0]) rail_cutout(rail_length, slot_radius);

        // Hollow cutout to reduce plastic use and weight.
        translate([-width / 4, 0, 0])
            hollow_cutout(width / 2, height, depth, 25, bevel_radius);
    }

    // Extension Attachment
    translate([width / 2 + bevel_radius, 0, 0]) attachment_extension(height, depth, bevel_radius);
}

// TODO(jenterkin): split out into separate component
module attachment_extension(height, depth, bevel_radius) {
    width = bevel_radius * 2;

    difference() {
        cube([width, height, depth], center=true);
        beveled_edge_cutout([width / 2, height / 2 * -1, 0], depth, bevel_radius);
        beveled_edge_cutout([width / 2, height / 2, 0], depth, bevel_radius);
    }

    // Attachment posts
    post_position = height / 2 - bevel_radius;
    post_radius = bevel_radius / 4;

    translate([0, post_position, depth / 2]) cylinder(r=post_radius, h=depth);
    translate([0, -post_position, depth / 2]) cylinder(r=post_radius, h=depth);
}

module rail_cutout(length, slot_radius) {
    // The .5 gives a 1mm buffer between slots. Maybe make configurable?
    slot_width = slot_radius * 2 + .5;

    // Set one fewer slot to give some buffer room before the edge.
    num_slots = length / slot_width - 1;

    // Subtracting 1 from num_slots since we're starting at 0.
    for (i=[0:1:num_slots - 1]) {
        // tolerance avoids z-fighting
        translate([i * slot_width, 0, tolerance + depth / 2])
            slot_cutout(slot_radius);
    }
}

module hollow_cutout(width, height, depth, cutout_border, bevel_radius) {
    adj_w = width - cutout_border;
    adj_h = height - cutout_border;

    difference() {
        cube([adj_w, adj_h, depth + 0.1], center=true);
        beveled_edge_cutout([-adj_w / 2, adj_h / 2, 0], depth, bevel_radius);
        beveled_edge_cutout([-adj_w / 2, adj_h / 2 * -1, 0], depth, bevel_radius);
        beveled_edge_cutout([adj_w / 2, adj_h / 2, 0], depth, bevel_radius);
        beveled_edge_cutout([adj_w / 2, adj_h / 2 * -1, 0], depth, bevel_radius);
    }
}
