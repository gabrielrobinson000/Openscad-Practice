$fn = 100;
mm = 1;
in = 25.4 * mm;
u = 1;
degree = 1;
diameter = .5;
p1=$preview?1+1/$fn:1;
use <Library_2021.scad>


Part_175();

module Part_175(){
    outerRadius = 12.5;
    innerRadius = 10;
    orbitalDistance = 50;
    angleHere = 180;
    translate([-orbitalDistance * 2, 0, 0])rotate([180, 0, 0])torus(outerRadius, innerRadius, orbitalDistance, angleHere);
    torus(outerRadius, innerRadius, orbitalDistance, angleHere);
    translate([orbitalDistance * 2, 0, 0])rotate([180, 0, 0])torus(outerRadius, innerRadius, orbitalDistance, angleHere);
    }