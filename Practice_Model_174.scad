$fn = 100;
mm = 1;
in = 25.4 * mm;
u = 1;
degree = 1;
diameter = .5;
p1=$preview?1+1/$fn:1;
use <Library_2021.scad>


Part_174();

module Part_174(){
    cylHeight = 50;
    outerRad = 30;
    innerRad = 20;
    
    cubeLength = 105;
    cubeWidth = 60;
    cubeHeight = 20;
    
    cubeCylCutRad = 17.5;
    cubeCylCutHeight = 60;
    
    annulusRadCut = 7.5;
    
    slitCutThickness = 4;
    
    
    difference(){
        annulus(outerRad, innerRad, cylHeight);
            translate([0, 0, cylHeight])rotate([90, 0, 0])cylinder(outerRad * 2, r= annulusRadCut, center= true);
            translate([- outerRad, - slitCutThickness / 2,0])cube([outerRad, slitCutThickness, cylHeight]);
    }
    difference(){
        translate([0, -cubeWidth / 2, 0])cube([cubeLength, cubeWidth, cubeHeight]);
        cylinder(cylHeight, r= outerRad);
        #rotate([0,90,0])translate([-cubeHeight, 0, cubeLength - cubeCylCutHeight])cylinder(cubeCylCutHeight, r= cubeCylCutRad);
        }
    }