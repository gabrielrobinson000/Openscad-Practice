$fn = 100;
mm = 1;
in = 25.4 * mm;
u = 1;
degree = 1;
diameter = .5;
p1=$preview?1+1/$fn:1;
use <Library_2021.scad>

Part_157();

module Part_157(){
    height = 40;
    orbitDistance = 200;
    
    BRingOut = 225;
    BRingInner = 175;
    
    middleD = 55;
    smallD = 45;
    
    cubeX = BRingOut + BRingInner;
    cubeY = height;
    
    difference(){
        annulus( BRingOut, BRingInner, height);//Biggest Ring
        
        rotate([0, 0, 60])translate([orbitDistance, 0, 0])cylinder(height, r= middleD);
        translate([orbitDistance, 0, 0])cylinder(height, r= smallD);
        rotate_extrude(angle = -300, convexity = 2)rotate([])square(cubeX , false);
        }
    rotate([0, 0, 60])translate([orbitDistance, 0, 0])annulus(middleD, 60 * diameter, height);//Middle Ring
    translate([orbitDistance, 0, 0])annulus(smallD, 50 * diameter, height);//Small Ring
    
    }