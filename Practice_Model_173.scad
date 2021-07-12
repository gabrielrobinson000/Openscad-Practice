$fn = 100;
mm = 1;
in = 25.4 * mm;
u = 1;
degree = 1;
diameter = .5;
p1=$preview?1+1/$fn:1;
use <Library_2021.scad>


Part_168();

module Part_168(){
    cube([120, 30, 60]);//Base
    translate([60, 0, 30])rotate([90, 0, 0])annulus(60 * diameter, 50 * diameter, 20);//Lens
    translate([15, 15, 60])cylinder(10, d= 15);//button one
    translate([120 - 7.5 - 15, 7.5, 60])cube([15, 15, 10]);//button two
    difference(){
        translate([(120 / 2) - (40 / 2), 0, 60])cube([40, 30, 10]);//center block
        translate([(120 / 2) - (40 / 2), 0, 60 + 10])
            rotate([0, 90, 0])
                linear_extrude(40)
                    polygon(points = [[0, 0], [10, 0], [0, 7.5]]);
        }
    }