$fn = 100;
mm = 1;
in = 25.4 * mm;
u = 1;
degree = 1;
diameter = .5;
p1=$preview?1+1/$fn:1;
use <Library_2021.scad>


Part_177();

module Part_177(){
    baseCylLeng = 130;
    endCutDiameter = 55;
    baseInnerRad = 35 / 2;
    endCutHeight = 12.5;
    
    outerRadShort = 81 / 2;
    outerRadTaller = 95 / 2;
    ridgeThickness = 10;
    
    innerOffTheEnds = 47.5;
    offTheEnds = 22.5;
    
    difference(){
        annulus(65 / 2, baseInnerRad, baseCylLeng);
            cylinder(endCutHeight, d= endCutDiameter);
            translate([0, 0, baseCylLeng - endCutHeight])cylinder(endCutHeight, d= endCutDiameter);
    }
    translate([0, 0, offTheEnds])annulus(outerRadShort, baseInnerRad, ridgeThickness);
    translate([0, 0, innerOffTheEnds])annulus(outerRadTaller, baseInnerRad, ridgeThickness);
    translate([0, 0, baseCylLeng - innerOffTheEnds - ridgeThickness])annulus(outerRadTaller, baseInnerRad, ridgeThickness);
    translate([0, 0, baseCylLeng - offTheEnds - ridgeThickness])annulus(outerRadShort, baseInnerRad, ridgeThickness);
    
}