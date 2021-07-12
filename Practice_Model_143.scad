$fn = 100;
mm = 1;
degree = 1;
diameter = .5;
use <Library_2021.scad>

Part_143();

module Part_143(){
    //annulus variables
    OuterRadiusAnnulus = 125 * mm * diameter;
    InnerRadiusAnnulus = 75 * mm * diameter;
    HeightAnnulus = 85 * mm;
    //orbital_cylinders variables
    OrbitalRadius = 95 * mm * diameter;
    NumberOfCylinders = 8;
    cylinderRadius = (13 * mm )* diameter;
    Height = 50 * mm;
    Xtilt = 0;
    Ytilt = 0;
    difference(){
        translate([PlateLength / 2, PlateWidth /2, PlateHeight])
        annulus(OuterRadiusAnnulus, InnerRadiusAnnulus, HeightAnnulus);
        translate([PlateLength / 2, PlateWidth /2, PlateHeight + (HeightAnnulus - Height)])
            orbital_cylinders(OrbitalRadius, NumberOfCylinders, cylinderRadius, Height, Xtilt, Ytilt);
    }
    // base-plate variables
    PlateLength = 295 * mm;
    PlateWidth = 150 * mm;
    PlateHeight = 15 * mm;
    //ceinture variables
    OuterRadius = 20 * mm;
    InnerRadius = 0;
    CeintureHeight = PlateHeight;
    BetweenCenters = 30 * mm;
    difference(){
    cube([PlateLength, PlateWidth, PlateHeight]);//Base-Plate
        translate([0,PlateWidth / 2,0])
            ceinture(OuterRadius, InnerRadius, CeintureHeight, BetweenCenters);//Side cuts Left
        translate([PlateLength - BetweenCenters,PlateWidth / 2,0])
            ceinture(OuterRadius, InnerRadius, CeintureHeight, BetweenCenters);//Side cuts Right
            Holes();
        } 
    module Holes(){
        YedgeOffset = 25 * mm;
        XedgeOffset = 30 * mm;
        ThroughHoleRadius = 18 * mm * diameter;
        translate([PlateLength / 2, PlateWidth /2, 0])
            cylinder(PlateHeight , r= InnerRadiusAnnulus);// Annulus center hole throught cut
        //Bottum Left
        translate([XedgeOffset, YedgeOffset, 0])cylinder(PlateHeight, r= ThroughHoleRadius);
        //Top Left
        translate([XedgeOffset, PlateWidth - YedgeOffset, 0])cylinder(PlateHeight, r= ThroughHoleRadius);
        //Top Right
        translate([PlateLength - XedgeOffset, PlateWidth - YedgeOffset, 0])cylinder(PlateHeight, r= ThroughHoleRadius);
        //Bottum Right
        translate([PlateLength - XedgeOffset, YedgeOffset, 0])cylinder(PlateHeight, r= ThroughHoleRadius);
        }
    }