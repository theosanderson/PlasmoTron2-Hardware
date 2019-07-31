$fn=20;
motor_dim=42.3;
hole_sep=31;
hole_sep2=25;
difference(){
cube([motor_dim+20,motor_dim,3]);
translate([(motor_dim-hole_sep)/2,(motor_dim-hole_sep)/2])cylinder(r=1.5,h=10);   
   translate([(motor_dim-hole_sep)/2,(motor_dim+hole_sep)/2])cylinder(r=1.5,h=10);     
     translate([(motor_dim+hole_sep)/2,(motor_dim+hole_sep)/2])cylinder(r=1.5,h=10);   
     translate([(motor_dim+hole_sep)/2,(motor_dim-hole_sep)/2])cylinder(r=1.5,h=10);   
    translate([(motor_dim)/2,(motor_dim)/2])cylinder(r=10,h=10);
    translate([motor_dim+10,(motor_dim+hole_sep2)/2,])cylinder(r=2.5,h=10);   
    translate([motor_dim+10,(motor_dim-hole_sep2)/2,])cylinder(r=2.5,h=10);   
}


