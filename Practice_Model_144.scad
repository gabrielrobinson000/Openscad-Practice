$fn = 100;
mm = 1;
degree = 1;
diameter = .5;
p1=$preview?1+1/$fn:1;
use <Library_2021.scad>

Part_144();

module Part_144(){
    Plate();
    OuterRadius = 50 * mm * diameter;
    InnerRadius = 30 * mm * diameter;
    Height = 70 * mm;
        annulus(OuterRadius, InnerRadius, Height);
    
    module Plate(){
    PlateThickness = 20 * mm;
    EdgeRadius = 30 * mm * diameter;
    OffsetX = (90 * mm) / 2;
    OffsetY = 85 * mm;// educticated guess
    OffsetZ = 0 * mm;
        leg_a = 75 * mm;
        leg_b = 45 * mm;
        OverLap_leg_a = leg_a * .1;
        Thickness = 10 * mm;
    translate([-Thickness / 2, OuterRadius - OverLap_leg_a, PlateThickness])
    rotate([90, 0, 90])
        Triangle(leg_a + OverLap_leg_a, leg_b, Thickness);//The bridge triangle thing

    difference(){
        hull(){
            translate([OffsetX, OffsetY, OffsetZ])
                cylinder(PlateThickness, r= EdgeRadius);// Top Left rounded corner
            translate([-OffsetX, OffsetY, OffsetZ])
                cylinder(PlateThickness, r= EdgeRadius);// Top Right Rounded corner
                cylinder(PlateThickness, r= OuterRadius);// Piece for hulling annulus like thing
        OverAllCubeLength = ((OffsetX * 2) + (EdgeRadius * 2));
        DepthOfCube = 20 * mm;//Complete guess
        CubeOffset = 60; //Complete guess
            translate([-OverAllCubeLength / 2, CubeOffset, 0])
                cube([OverAllCubeLength, DepthOfCube, PlateThickness]);
            }
            cylinder(PlateThickness, r= InnerRadius);// Piece for putting a hole in hulling annulus like thing
        CutRadius = 15 * mm * diameter;
        CutOffsetY = 75 * mm;
            translate([OffsetX, CutOffsetY, OffsetZ])
                cylinder(PlateThickness, r= CutRadius);// Top Left cut cylinder
            translate([-OffsetX, CutOffsetY, OffsetZ])
                cylinder(PlateThickness, r= CutRadius);// Top Right cut cylinder

        }
    }
    module Triangle(leg_a, leg_b, Thickness){
        linear_extrude(Thickness){
            polygon( points = [[0, 0],[leg_a, 0],[0, leg_b]]);
                }
            }
}