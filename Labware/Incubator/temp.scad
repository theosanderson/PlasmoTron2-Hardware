use <gears.scad>
use <gear_grub.scad>

    $fn = 30;
acrylic_thickness = 5;
compressed_gasket_thickness = 2;
door_thickness = 5;

aperture_width = 90;
aperture_height = 30;
aperture_length = 50;



door_hinge_pivot = 10;

door_hinge_rod_radius = 1.5;
door_hinge_hinge_thickness = 5;
door_hinge_hinge_radius = 5;
door_hinge_hinge_connector_height = 20;

door_frame_thickness = 2;
door_frame_depth = 10;

linkage_thickness = 5;
linkage_height = -30;

module aperture() {
    #
    color("white") cube([aperture_width / 2, aperture_length, aperture_height]);

};

module doorframe() {
    difference() {
        translate([0, 0, -door_frame_thickness])
        cube([aperture_width / 2 + acrylic_thickness + door_frame_thickness, door_frame_depth, aperture_height + acrylic_thickness * 2 + door_frame_thickness * 2]);
        translate([0, door_frame_thickness, 0]) cube([aperture_width / 2 + acrylic_thickness, aperture_length - door_frame_thickness, aperture_height + acrylic_thickness * 2]);


        translate([0, 0, acrylic_thickness])
        cube([aperture_width / 2, aperture_length, aperture_height]);
    }
}

doorframe();
//color("blue")aperture_box();
module aperture_box() {
    translate([0, door_frame_thickness, 0]) aperture_box_acrylic();
}

module aperture_box_acrylic() {
    difference() {
        cube([aperture_width / 2 + acrylic_thickness, aperture_length - door_frame_thickness, aperture_height + acrylic_thickness * 2]);
        translate([0, 0, acrylic_thickness])
        cube([aperture_width / 2, aperture_length, aperture_height]);
    }

};
//aperture_box();


module gasket() {
    color("blue") cube([aperture_width / 2 + acrylic_thickness, compressed_gasket_thickness, aperture_height + acrylic_thickness * 2]);
}

// translate([0,-compressed_gasket_thickness,0])gasket();


module linkage_point_at_pivotg() {



}




module door() {
    color("red") cube([aperture_width / 2 + acrylic_thickness, door_thickness, aperture_height + acrylic_thickness * 2]);
    // door_hinge();


}

module door_at_zero() {

    translate([0, door_hinge_pivot, -aperture_height / 2 - acrylic_thickness])
    door();
}

module door_with_linkage(linkage_translation) {
    translate(linkage_translation)
    translate([0, door_hinge_pivot, -aperture_height / 2 - acrylic_thickness])
    door();
}




module door_with_linkage_at_angle(angle = 0) {
    linkage_vec = [0, -7, -23];
    translate(-linkage_vec)
    translate([0, -door_hinge_pivot - door_thickness - compressed_gasket_thickness, aperture_height / 2 + acrylic_thickness]) {
        // rotate(90,[0,1,0]) cylinder(r=1,h=30);
        rotate(angle, [-1, 0, 0]) door_with_linkage(linkage_vec);
    }

}
door_with_linkage_at_angle(0);

module hinge() {
    translate([0, 0, aperture_height + acrylic_thickness * 2 + door_frame_thickness * 1]) cube([door_hinge_hinge_thickness, door_frame_depth, 20]);

    difference() {
        hull() {
            translate([0, 0, aperture_height + acrylic_thickness * 2 + door_frame_thickness * 1 + 10]) cube([door_hinge_hinge_thickness, door_frame_depth, 10]);

            linkage_vec = [0, -7, -23];
            translate(-linkage_vec)
            translate([0, -door_hinge_pivot - door_thickness - compressed_gasket_thickness, aperture_height / 2 + acrylic_thickness])
            rotate(90, [0, 1, 0]) cylinder(r = door_hinge_rod_radius * 2, h = door_hinge_hinge_thickness);

        }
        linkage_vec = [0, -7, -23];
        translate(-linkage_vec)
        translate([0, -door_hinge_pivot - door_thickness - compressed_gasket_thickness, aperture_height / 2 + acrylic_thickness])# rotate(90, [0, 1, 0]) cylinder(r = door_hinge_rod_radius, h = door_hinge_hinge_thickness);
    }
}
translate([aperture_width / 2, 0, 0])
hinge();


 linkage_vec = [0, -7, -23];
 cog1_vec = [0, -door_hinge_pivot - door_thickness - compressed_gasket_thickness, aperture_height / 2 + acrylic_thickness]-linkage_vec;
cog1_width=15;

module cog() {
   
    translate(cog1_vec)
    rotate(90, [0, 1, 0]) herringbone_gear(modul = 1, tooth_number = 15, width = cog1_width, bore = 3, pressure_angle = 20, helix_angle = 20, optimized = true);
};

cog();


cog2_vec = cog1_vec+[0,0,11];

cog2_width = 15;
module cog2() {
    translate(cog2_vec)
    rotate(90, [0, 1, 0]) rotate(103, [0, 0, 1]) herringbone_gear(modul = 1, tooth_number = 7, width = cog2_width, bore = 3, pressure_angle = 20, helix_angle = -20, optimized = true);
};
#cog2();


cog2_spacer_width=1;
module cog2joiner() {
    translate(cog2_vec+[cog2_width,0,0])
    rotate(90, [0, 1, 0]) difference(){
        cylinder(r=3,h=cog2_spacer_width);
        cylinder(r=1.5,h=cog2_spacer_width);
}
};
cog2joiner();



module cog2b() {
    translate(cog2_vec+[cog2_width+cog2_spacer_width,0,0])
    rotate(90, [0, 1, 0]) rotate(45, [0, 0, 1]) herringbone_gear(modul = 1, tooth_number = 16, width = 15, bore = 3, pressure_angle = 20, helix_angle = -20, optimized = true);
};
cog2b();






cog5_vec = [cog2_spacer_width+cog2_width, 6.5 - door_hinge_pivot - door_thickness - compressed_gasket_thickness, -23 + aperture_height + acrylic_thickness * 2 + door_frame_thickness + 43.18 / 2] - linkage_vec;

module cog5() {
    translate(cog5_vec)
    rotate(90, [0, 1, 0]) rotate(16.5, [0, 0, 1]) herringbone_gear(modul = 1, tooth_number = 7, width = 15, bore = 3, pressure_angle = 20, helix_angle = 20, optimized = true);
};
cog5();

cog6_width=4;
cog6_vec= cog5_vec - [cog2_spacer_width+cog2_width+cog6_width,0,0];

module cog6(){

translate(cog6_vec)

rotate(-90, [0, 0, 1]) rotate(-90, [1, 0, 0]) bevel_herringbone_gear_pair(modul = 1, gear_teeth = 19, pinion_teeth = 6, axis_angle = 90, tooth_width = 5, bore = 3, pressure_angle = 20, helix_angle = 30, together_built = true);
    difference(){
        union(){
    
    translate(cog6_vec+[-5,0,0])rotate(-90, [0, 0, 1]) rotate(-90, [1, 0, 0]) cylinder(r=9,h=5);
    hull(){
    translate(cog6_vec+[0,0,0])rotate(-90, [0, 0, 1]) rotate(-90, [1, 0, 0]) cylinder(r=4,h=1);
        translate(cog5_vec+[-1,0,0])rotate(-90, [0, 0, 1]) rotate(-90, [1, 0, 0]) cylinder(r=2.2,h=1);
    }
}
#translate(cog6_vec+[-5,0,0])rotate(-90, [0, 0, 1]) rotate(-90, [1, 0, 0]) cylinder(r=1.5,h=90);
        
    }
    
    
}
cog6();
gear_grub();
           
           