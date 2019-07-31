extrusion_length_for_plate_holder_box = 145;
extrusion_width_for_plate_holder_box = 110;
extrusion_height_for_plate_holder_box = 50;
orbit_radius=5;
theta=30;
spinner_gap=28;
dampener_gap=10;
spun_platebox_height=100;
spacing=10;
space_for_apparatus=0;

total_height=600;

module flatbox(length,width,include_cross=true){
    translate([-(width+40)/2,-length/2]){
cube([20,length,20]);
translate([20+width,0])cube([20,length,20]);
        if(include_cross){
translate([20,0])color("red")
cube([width,20,20]);
color("red")
translate([20,length-20])cube([width,20,20]);
        }
}
}

module flatboxconverse(length,width,include_cross=true){
    translate([-length/2,-(width+40)/2]){
cube([length,20,20]);
translate([0,20+width])cube([length,20,20]);
        if(include_cross){
translate([0,20])color("red")
cube([20,width,20]);
color("red")
translate([length-20,20])cube([20,width,20]);
        }
}
}




module flatbox_support(){
     color("purple")
  translate([extrusion_width_for_plate_holder_box/2,-extrusion_length_for_plate_holder_box/2-spacing-space_for_apparatus,0]) cube([20,space_for_apparatus+extrusion_length_for_plate_holder_box+spacing*2,20]);
       

color("purple")
translate([-20-extrusion_width_for_plate_holder_box/2,-extrusion_length_for_plate_holder_box/2-spacing-space_for_apparatus,0]) cube([20,space_for_apparatus+extrusion_length_for_plate_holder_box+spacing*2,20]);
    }
    
module flatbox_for_plates(){
    flatbox(extrusion_length_for_plate_holder_box,extrusion_width_for_plate_holder_box);
    }

module platebox(height){
flatbox_for_plates();

    translate([-(extrusion_width_for_plate_holder_box+40)/2,-extrusion_length_for_plate_holder_box/2]){
    color("blue") translate([0,0,20])cube([20,20,height]);
    color("blue") translate([20+extrusion_width_for_plate_holder_box,0,20])cube([20,20,height]);
    color("blue") translate([20+extrusion_width_for_plate_holder_box,extrusion_length_for_plate_holder_box-20,20])cube([20,20,height]);
    color("blue") translate([0,extrusion_length_for_plate_holder_box-20,20])cube([20,20,height]);
    }
    translate([0,0,20+height])flatbox_for_plates();
}


flatbox_support();
translate([0,0,20+dampener_gap])
flatbox_for_plates();
translate([orbit_radius*sin($t*360),orbit_radius*cos($t*360),20+dampener_gap+20+spinner_gap])
platebox(spun_platebox_height);
translate([0,0,20+dampener_gap+20+spinner_gap*2+spun_platebox_height+40]) flatbox_for_plates(); 

translate([0,0,20+dampener_gap+20+spinner_gap*2+spun_platebox_height+40+20+dampener_gap]) flatbox_support(); 


module 4posts(){
    color("green")
translate([extrusion_width_for_plate_holder_box/2,extrusion_length_for_plate_holder_box/2+spacing,0]) cube([40,20,total_height]);
color("green")
translate([extrusion_width_for_plate_holder_box/2,-extrusion_length_for_plate_holder_box/2-spacing-space_for_apparatus-20,0]) cube([40,20,total_height]);
        color("green")
translate([-extrusion_width_for_plate_holder_box/2-40,extrusion_length_for_plate_holder_box/2+spacing,0]) cube([40,20,total_height]);
color("green")
translate([-extrusion_width_for_plate_holder_box/2-40,-extrusion_length_for_plate_holder_box/2-spacing-20-space_for_apparatus,0]) cube([40,20,total_height]);
};

4posts();