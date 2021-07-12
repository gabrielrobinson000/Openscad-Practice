$fn = 100;
mm = 1;
in = 25.4 * mm;
u = 1;
degree = 1;
diameter = .5;
p1=$preview?1+1/$fn:1;
use <Library_2021.scad>


Part_163();

module Part_163(){
    
    difference(){
        rotate([0, 90, 0])annulus(OuterRad, InnerRad, LongPipe, true);
            cylinder(ShortPipe, r= InnerRad);}
    difference(){
        annulus(OuterRad, InnerRad, ShortPipe);
            rotate([0, 90, 0])cylinder(LongPipe, r= InnerRad, center= true);}
    
    translate([0, 0, ShortPipe])PipeCover();// Top
    translate([LongPipe / 2, 0, 0])rotate([0, 90, 0])PipeCover();//Left
    translate([-LongPipe / 2, 0, 0])rotate([0, -90, 0])PipeCover();//Right
    
    module PipeCover(){
        difference(){
            annulus(CouterRad, InnerRad,CoverThickness);
            orbital_cylinders(OrbitalRadius, NumberOfCylinders, cylinderRadius, CoverThickness, Xtilt= 0, Ytilt= 0);
        }    
    }
        OuterRad = 45;
        InnerRad = 35;
        
        LongPipe = 250;
        ShortPipe = 150;
        
        CoverThickness = 10;
        CouterRad = 75;
        
        OrbitalRadius = 60;
        NumberOfCylinders = 4;
        cylinderRadius = 7.5;
    }