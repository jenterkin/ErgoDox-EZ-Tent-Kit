$fn = 25;

module hinge_bottom(size) {
    difference() {
        union() {
            translate([0, 0, size / 2 / 2 * -1]) cube([size, size, size / 2], center=true);
            rotate([90, 0, 0]) cylinder(r=size / 2, h=size, center=true);
        }

        rotate([90, 0, 0]) cylinder(r=size / 2 - 1, h=size, center=true);
    }
}
