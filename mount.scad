
// Origin of phone is bottom left corner of screen face (slightly off of phone
// due to round bezels)
// X axis is long dimension, Y axis is short dimension, Z is thickness

phone_length = 128;
phone_width = 66;
phone_thickness = 11;
phone_bulge_thickness = 15;
phone_bulge_length = 33;
phone_corner_radius = 5;
phone_bulge_ramp = 10;

phone_camera_x = 10;
phone_camera_y = 45;
phone_camera_z = -phone_bulge_thickness;

module phone_corner() {
    translate([0, 0, -phone_thickness]) cylinder(r=phone_corner_radius, h=phone_thickness);
}
module phone_bulge_corner() {
    translate([0, 0, -phone_bulge_thickness]) {
        cylinder(r=phone_corner_radius, h=phone_thickness);
    }
}

module phone() {
    r = phone_corner_radius;
    width = phone_width;
    length = phone_length;
    thickness = phone_thickness;
    bulge_length = phone_bulge_length;
    bulge_ramp = phone_bulge_ramp;
    hull() {
        translate([r, r, 0]) phone_corner();
        translate([length - r, r, 0]) phone_corner();
        translate([length - r, width - r, 0]) phone_corner();
        translate([r, width - r, 0]) phone_corner();
    }
    hull() {
        translate([r, r, 0]) phone_bulge_corner();
        translate([bulge_length - bulge_ramp - r, r, 0]) phone_bulge_corner();
        translate([bulge_length - bulge_ramp - r, width - r, 0]) phone_bulge_corner();
        translate([r, width - r, 0]) phone_bulge_corner();
        translate([bulge_length - r, r, 0]) phone_corner();
        translate([bulge_length - r, width - r, 0]) phone_corner();
    }
}

phone();
