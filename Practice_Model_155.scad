$fn = 100;
mm = 1;
in = 25.4 * mm;
u = 1;
degree = 1;
diameter = .5;
p1=$preview?1+1/$fn:1;
use <Library_2021.scad>


Part_155();

module Part_155(){
    
    annulus(30 * diameter,20 * diameter, 50, true);
    //rotate_extrude(convexity = 10, $fn = 100)translate([15+PI, 0, 0])circle(r= 30, $fn=3);
    //translate([0,0, 15])annulus(40 * diameter, 30 * diameter, 10);
    //mirror([0,0,1])translate([0,0, 15])annulus(40 * diameter, 30 * diameter, 10);
    difference(){
        rotate_extrude(convexity = 10, $fn = 100)translate([15, 0, 0])polygon(points = [[0, 15], [0, -15], [40,0]]);
        translate([0,0, -50 / 2])cube(100);
        mirror([1, 1, 0])translate([0,0, -50 / 2])cube(100);
        }
    
    }