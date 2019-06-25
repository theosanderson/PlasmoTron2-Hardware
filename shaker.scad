plate_x = 127.71;
plate_y= 85.43;
plate_tolerance=1;
plate_z=30;
plate_z_tolerance=5;

corner_inset=9;
corner_outset=5;
corner_height=5;
corner_bottom=1.5;

support_thickness_y=3;
support_thickness_z=3;
support_extra_gap = 2;
module neg_plate(){
    hull(){
    cube([plate_x/2+plate_tolerance, plate_y/2+plate_tolerance,0.1]);
    
    translate([0,0,top_of_neg_plate])
    cube([plate_x/2+plate_tolerance, plate_y/2+plate_tolerance,0.1]);
    }
}





module corner(){
    translate([plate_x/2+plate_tolerance-corner_inset, plate_y/2+plate_tolerance-corner_inset,0])
    cube([corner_inset+corner_outset,corner_inset+corner_outset,corner_height]);
    
}


difference(){
    union(){
    corner();
    translate([plate_x/2+plate_tolerance+support_extra_gap,0,0])
        cube([support_thickness_y,plate_y/2+plate_tolerance,support_thickness_z]);
    translate([0,plate_y/2+plate_tolerance+support_extra_gap,0])
        cube([plate_x/2+plate_tolerance,support_thickness_y,support_thickness_z]);
    }
    translate([0,0,corner_bottom]) neg_plate();
}