$fn = 100;
mm = 1;
degree = 1;
diameter = .5;
use <library.scad>

outerRadius    = 48 * diameter;
innerRadius    = 15 * diameter;
cylinderHeight = 70 ;
Length         = 85;

cylinderBodyHeight = 15;

difference(){
    anulus(outerRadius, innerRadius, cylinderHeight);

cylCutDiameter = 30 * diameter;
cylCutHeight = 15;
    cylinder(cylCutHeight, r = cylCutDiameter);


    translate([0, 0, cylinderHeight - cylCutHeight])
        cylinder(cylCutHeight, r = cylCutDiameter);
}

anulus_body(outerRadius, innerRadius, cylinderBodyHeight, Length);

PlateHeight = 60;

difference(){
    translate([Length - cylinderBodyHeight, -outerRadius, -PlateHeight + cylinderBodyHeight])
        cube([cylinderBodyHeight, outerRadius * 2, PlateHeight]);

outerRadius2 = 8;
innerRadius2 = 0;
BetweenCenters = 20;

translate([Length - cylinderBodyHeight, 0, -PlateHeight + BetweenCenters + outerRadius2])
rotate([0, 90, 0])
    anulus_hull(outerRadius2, innerRadius2, cylinderBodyHeight, BetweenCenters);
}