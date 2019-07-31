extrusion_size=20;
hole_size_for_extrusion=5;
hole_size_for_shock_absorber=4;
thickness=5;
length=35;

extra=10;
$fn=50;

hole=15;
connector=3;

//color("red") cube([20,200,20]);
difference(){
union(){translate([extrusion_size,0,extrusion_size-thickness])
cube([extra,length,thickness]);
    translate([extrusion_size,0,0])
cube([thickness,length/2-hole/2,extrusion_size]);
translate([extrusion_size,length/2+hole/2,0])
cube([thickness,length/2-hole/2,extrusion_size]);

translate([extrusion_size,0,0])
cube([thickness,length,connector]);}
    
#translate([extrusion_size/2,5,10]) rotate(90,[0,1,0]) cylinder(r=hole_size_for_extrusion/2,h=20);
    
   
#translate([extrusion_size/2,length-5,10])  rotate(90,[0,1,0]) cylinder(r=hole_size_for_extrusion/2,h=20);    
    
  #  translate([extrusion_size+extra/2,length/2,10]) cylinder(r=1*+hole_size_for_shock_absorber/2,h=20);    
}

