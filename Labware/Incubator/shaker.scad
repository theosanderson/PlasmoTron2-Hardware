$fn=30;
plate_x = 127.71;
plate_y= 85.43;
plate_tolerance=0.1;
plate_z=30;
plate_z_tolerance=5;

corner_inset=9;
corner_outset=5;
corner_height=5;
corner_bottom=1.5;
corner_gap=5;

support_thickness_y=3;
support_thickness_z=3;
support_extra_gap = 2;
top_of_neg_plate=10;
plate_top_extra = 5;

holder_extra=4;

holder_depth=2;
middle_size=20;
middle_size_x=20;
middle_overlap=10;
gapwidth = 80;
riser_width=3;
riser_height=40;
screw_big_hole = 4;
screw_small_hole= 1.6;

module neg_plate(){
    hull(){
    cube([plate_x/2+plate_tolerance, plate_y/2+plate_tolerance,0.1]);
    
    translate([0,0,top_of_neg_plate])
    cube([plate_x/2+plate_tolerance+plate_top_extra, plate_y/2+plate_tolerance+plate_top_extra,0.1]);
    }
}





module corner(){
    translate([plate_x/2+plate_tolerance-corner_inset, plate_y/2+plate_tolerance-corner_inset,0])
    cube([corner_inset+corner_outset,corner_inset+corner_outset,corner_height]);
    
        translate([plate_x/2+plate_tolerance-corner_inset, plate_y/2+plate_tolerance-corner_inset,0])
    cube([corner_inset+corner_outset,corner_inset+corner_outset+corner_gap,corner_height]);
    translate([plate_x/2+plate_tolerance-corner_inset, plate_y/2+plate_tolerance-corner_inset+corner_gap+corner_inset+corner_outset - riser_width,0])
    difference(){
    cube([corner_inset+corner_outset,riser_width,riser_height]);
        translate([+(corner_inset+corner_outset)/2,0,riser_height/2])
        rotate(90,[1,0,0])
        union()
    {#cylinder(r=screw_small_hole,h=20,center=true);
        #cylinder(r=screw_big_hole,h=2,center=true);
        
    }
    }
    
    
}


module rack(){
difference(){
    union(){
    corner();
    translate([plate_x/2+plate_tolerance+support_extra_gap,middle_size,0])
        cube([support_thickness_y,plate_y/2+plate_tolerance-middle_size,support_thickness_z]);
    translate([middle_size,plate_y/2+plate_tolerance+support_extra_gap,0])
        cube([plate_x/2+plate_tolerance-middle_size,support_thickness_y,support_thickness_z]);
        
        translate([plate_x/2+plate_tolerance+support_extra_gap+support_thickness_y,0,0])
        cube([support_thickness_y,middle_overlap+middle_size,support_thickness_z]);
    translate([0,plate_y/2+plate_tolerance+support_extra_gap+support_thickness_y,0])
        cube([middle_overlap+middle_size,support_thickness_y,support_thickness_z]);
    }
    
    translate([0,0,holder_depth]) neg_plate();
};
}



module unit(){
difference(){
quadcopy()  rack();
    translate([0,-gapwidth/2,0])cube([500,gapwidth,30]);
}
}


module holder(){
difference(){
    union(){
  
    
        cube([support_thickness_y,plate_y/2+plate_tolerance + holder_extra,support_thickness_z]);
    
        cube([plate_x/2+plate_tolerance + holder_extra,support_thickness_y,support_thickness_z]);
    }
    translate([0,0,corner_bottom]) neg_plate();
};
}



module copy_mirror(vec=[0,1,0])
{
    children();
    mirror(vec) children();
}

module quadcopy()
{
    copy_mirror([1,0,0]) copy_mirror() children();
}



quadcopy() color("red") holder();

for(x=[0:riser_height:120]){
    translate([0,0,x]){
        unit();
    }
}
