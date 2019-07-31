$fn=50;
use <MCAD/nuts_and_bolts.scad>
use <includes/parametric-pulley-generator.scad>

bearing_id=7.95;
bearing_od=22;
bearing_inset_t=7;
bearing_upper_t=5;
bearing_extra=2;
orbit_radius=5;
offset_mm=2;

module bearing_binding(){
    difference(){
    cylinder(r=bearing_id/2,h=bearing_inset_t);
    cylinder(r=1.5,h=10);    
    
    
    }
    
}


module half_positive(){
    bearing_binding();

   
    translate([0,0,bearing_inset_t])
    cylinder(r=bearing_id/2+bearing_extra,h=bearing_upper_t);

    
    };
    
    
module half_negative(){

   
    
    translate([0,0,9.5]){
        scale([1,1,1.05]){
   //  #nutHole(3)
            ;}}
             translate([-2,0,9.5]){
        scale([1,1,1.05]){
    // #nutHole(3)
            ;}}
    
        

    
    
    
        

    
     cylinder(r=1.5,h=12);    
    


    
    
    
    };

difference(){
    union(){
half_positive();
    translate([orbit_radius,0,bearing_inset_t*2+bearing_upper_t+offset_mm])
rotate(180,[0,1,0]) half_positive();}
    
    half_negative();
    translate([orbit_radius,0,bearing_inset_t*2+bearing_upper_t+offset_mm])
rotate(180,[0,1,0]) half_negative();
}


//cylinder(r=bearing_id/2,h=20);
//color("red") cylinder(r=22/2,h=7);


