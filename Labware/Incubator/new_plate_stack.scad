use <includes/Tslot.scad>
use <MCAD/nuts_and_bolts.scad>


total_width=110;
total_length=145;
$fn=80;
plate_x = 127.71;
plate_y= 85.43;
plate_tolerance=0.1;
plate_z=30;
plate_z_tolerance=5;
bottom_thickness=2;

top_of_neg_plate=10;
plate_top_extra = 5;

gapwidth = 80;
riser_width=3;
riser_length=20;
riser_height=40;
screw_big_hole = 7;
screw_small_hole= 2.5;

number_of_units = 4;

holder_height=7;
module neg_plate(){
    hull(){
    cube([plate_x/2+plate_tolerance, plate_y/2+plate_tolerance,0.1]);
    
    translate([0,0,top_of_neg_plate])
    cube([plate_x/2+plate_tolerance+plate_top_extra, plate_y/2+plate_tolerance+plate_top_extra,0.1]);
    }
}


module riser(){
    difference(){
    cube([riser_length,riser_width,riser_height]);
        translate([+(riser_length)/2,0,riser_height/2])
        rotate(90,[1,0,0])
        union()
    {#cylinder(r=screw_small_hole,h=20,center=true);
        #cylinder(r=screw_big_hole,h=2,center=true);
        
    }
    }
};

module corner(){
translate([total_length/2- riser_length,total_width/2-riser_width])
riser();    

difference(){
cube([total_length/2,total_width/2,holder_height]);
translate([0,0,bottom_thickness])
neg_plate();
}
}



support_thickness_y=3;
support_thickness_z=3;
holder_extra=4;
holder_negative_padding=3;

module holder(){
difference(){
    union(){
  
    
        cube([support_thickness_y,plate_y/2+plate_tolerance + holder_extra,support_thickness_z]);
    
        cube([plate_x/2+plate_tolerance + holder_extra,support_thickness_y,support_thickness_z]);
    }
    translate([0,0,1]) neg_plate();
};
}
module holder_neg(){
difference(){
    union(){
  
    
        cube([support_thickness_y+holder_negative_padding,plate_y/2+plate_tolerance + holder_extra+holder_negative_padding,20]);
    
        cube([plate_x/2+plate_tolerance + holder_extra+holder_negative_padding,support_thickness_y,support_thickness_z+holder_negative_padding]);
    }
 
};
}


color("red") holder();
