extrusion_size=20;
hole_size_for_extrusion=5;
hole_size_for_shock_absorber=4;
thickness=5;
length=20;

extra=10;
$fn=50;

difference(){
cube([extrusion_size+extra,length,thickness]);
translate([extrusion_size/2,5,0]) cylinder(r=hole_size_for_extrusion/2,h=20);
    
translate([extrusion_size/2,length-5,0]) cylinder(r=hole_size_for_extrusion/2,h=20);    
    
    translate([extrusion_size+extra/2,length/2,0]) cylinder(r=hole_size_for_shock_absorber/2,h=20);    
}

