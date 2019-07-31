$fn=50;
dim_x=26;
dim_y=50-4;
plate_thickness=3;
hole_pos=5;
module holder(){
difference(){
cube([dim_x,dim_y,plate_thickness]);
    translate([dim_x/2,dim_y/2,0]) cylinder(r=8,h=7);
    translate([10,hole_pos,0]) cylinder(r=2.5,h=7);
     translate([10,dim_y-hole_pos,0]) cylinder(r=2.5,h=7);
    
};


    translate([dim_x/2,dim_y/2,plate_thickness]){
        difference(){
cylinder(r=13,h=7);
cylinder(r=11,h=7);
        }
    
}

};
holder();
module cap(){
translate([50,0,0]) 

difference(){
cylinder(r=15,h=9);
cylinder(r=13.1,h=7.5);
    cylinder(r=9,h=20);
        }
    };
        
        
       //# translate([dim_x/2,dim_y/2,0]) cylinder(r=4,h=15);
        
       //# cube([20,100,20]);