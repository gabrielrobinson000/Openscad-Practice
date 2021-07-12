$fn = 100;
mm = 1;
in = 25.4 * mm;
u = 1;
degree = 1;
diameter = .5;
p1=$preview?1+1/$fn:1;
use <Library_2021.scad>

Part_154(); // Annulusi and cones

module Part_154(){
    
    annulus(100 * diameter, 70 * diameter, 150, true);// outer big annulus
    difference(){
        annulus(50 * diameter, 30 * diameter, 100, true);// inner small annulus
        cylinder(h= 50, d1= 30, d2= 40, center= false);
        mirror([0, 0, 1])cylinder(h= 50, d1= 30, d2= 40, center= false);
    }
    annulus(120 * diameter, 50 * diameter, 12, true);// linking annulus 
    
    }
