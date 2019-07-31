$fn=80;
inner_diameter_for_pip = 7.5;
section_2_diam=6;
inner_diameter_for_sec3 = 1.5;


pipette_wall=1;

top_section=8;

section_2_height=34;
section_3_height=38;

tip_negative_hole=4;
tip_negative_extra=2;

module tip(){
difference(){
cylinder(r=inner_diameter_for_pip/2+pipette_wall,h=top_section);
cylinder(r=inner_diameter_for_pip/2,h=top_section);    
    
    }
    translate([0,0,top_section])
    difference(){
cylinder(r1=inner_diameter_for_pip/2+pipette_wall, r2=section_2_diam/2+pipette_wall,h=section_2_height);
cylinder(r1=inner_diameter_for_pip/2, r2=section_2_diam/2,h=section_2_height);   
    
    }
    
    
        translate([0,0,top_section+section_2_height])
    difference(){
cylinder(r2=inner_diameter_for_sec3/2+pipette_wall, r1=section_2_diam/2+pipette_wall,h=section_3_height);
cylinder(r2=inner_diameter_for_sec3/2, r1=section_2_diam/2,h=section_3_height);
    
    }
}

module tipnegative(){

cylinder(r=inner_diameter_for_pip/2+pipette_wall,h=top_section);

    translate([0,0,top_section])
   
cylinder(r1=inner_diameter_for_pip/2+pipette_wall, r2=section_2_diam/2+pipette_wall,h=section_2_height);
 
    
    
    
    
        translate([0,0,top_section+section_2_height])

cylinder(r2=tip_negative_hole, r1=section_2_diam/2+pipette_wall,h=section_3_height);


};

tip();
