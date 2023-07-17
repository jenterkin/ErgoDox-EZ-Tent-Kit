module slot_cutout(radius) {
    difference() {
        rotate([270, 0, 0]) cylinder(r=radius, h=radius*2, center=true);
        translate([0, 0, radius / 2]) cube([radius * 2, radius * 2, radius], center=true);
    }
}
