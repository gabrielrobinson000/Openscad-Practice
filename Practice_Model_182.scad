$fn = 100;
mm = 1;
in = 25.4 * mm;
u = 1;
degree = 1;
diameter = .5;
p1=$preview?1+1/$fn:1;
use <Library_2021.scad>


Part_182();

module Part_182(){
    height = 30;
    holeCylCutD = 40;
    
    outerDiameter = 20;
    innerDiameter = 15;
    annulusHeight = 50;
    
    difference(){
        cylinder(height, d1 = 80, d2= 80, $fn= 6, center= true);
        cylinder(height, d= holeCylCutD, center= true);
        for (Hole = [0:3]){
            rotate([30, 90, 360/3 * Hole])
                #cylinder(holeCylCutD * 6, d= innerDiameter, center= true);
        }
    }
    for (Hole = [0:6]){
            rotate([30, 90, 360/6 * Hole])
                translate([0, 0, 34.63])
                annulus(outerDiameter * diameter, innerDiameter * diameter, annulusHeight);
        }
}