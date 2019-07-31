$fn=30;
inner_diameter=8;
outer_diameter=20;
extra=2;
thickness=1;
total_thickness=6;

difference(){
cylinder(r=inner_diameter/2+extra, h=total_thickness,center=true);
    cylinder(r=inner_diameter/2, h=total_thickness,center=true);
}

difference(){
cylinder(r=outer_diameter, h=thickness,center=true);
    translate([100,0,0]) cube([200,200,200],center=true);
    cylinder(r=inner_diameter/2, h=total_thickness,center=true);
}