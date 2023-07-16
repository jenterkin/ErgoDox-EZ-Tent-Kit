// Create a cutout for beveling 90 degree edges.
// TODO: Currently only supports bevels along x and y, support z.
module beveled_edge_cutout(pos, depth, radius) {
    // assume 0 invalid and break
    x = pos[0] > 0 ? pos[0] - radius : pos[0] + radius;
    y = pos[1] > 0 ? pos[1] - radius : pos[1] + radius;

    rotation = (pos[0] < 0 && pos[1] < 0) ? 180
        : (pos[0] < 0 && pos[1] > 0) ? 90
        : (pos[0] > 0 && pos[1] < 0) ? 270 : 0;

    translate([x, y, pos[2]]) {
        rotate([0, 0, rotation]) difference() {
            cube([radius * 2, radius * 2, depth], center=true);
            cylinder(r=radius, h=depth, center=true);
            translate([-radius/2, 0, 0])
                cube([radius, radius * 2, depth], center=true);
            translate([0, -radius/2,0])
                cube([radius * 2, radius, depth], center=true);
        }
    }
}
