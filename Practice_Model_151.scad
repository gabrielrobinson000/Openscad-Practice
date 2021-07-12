$fn = 100;
mm = 1;
in = 25.4 * mm;
u = 1;
degree = 1;
diameter = .5;
p1=$preview?1+1/$fn:1;
use <Library_2021.scad>


Part_151();

module Part_151(){
    // Annulus values 
        OuterDiameter = 30 * diameter;
        InnerDiameter = 10 * diameter;
        Height = 100;
    // Torus values
        OuterPipe = 7.5;
        InnerPipe = InnerDiameter;
        OrbitalDistance = 40;
        AngleHere = 90;
    
    rotate([90, 0, 0])torus(OuterPipe, InnerPipe, OrbitalDistance, AngleHere);
    
    rotate([0, -90, 0])translate([OrbitalDistance, 0, 0])annulus(OuterDiameter, InnerDiameter, Height);
    
    translate([OrbitalDistance, 0, -Height])annulus(OuterDiameter, InnerDiameter, Height);
    
    
    
    
    }
