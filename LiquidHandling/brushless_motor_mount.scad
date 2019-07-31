$fn=30;
thickness=3;
motor_diameter=36;
extrusion = 20;

difference(){
    hull(){
    translate([motor_diameter/2,-motor_diameter/2,0])
cube([extrusion, motor_diameter, thickness]);
   
cylinder(r=motor_diameter/2,h=thickness); }
for(counter = [0 : 5]){
rotate(60*counter)
translate([25/2,0,0]) cylinder(r=1.5,h=10);
};
cylinder(r=3,h=10);

translate([motor_diameter/2+extrusion/2,-motor_diameter/2+8,0])
cylinder(r=2.5,h=10);

translate([motor_diameter/2+extrusion/2,motor_diameter/2-8,0])
cylinder(r=2.5,h=10);


};