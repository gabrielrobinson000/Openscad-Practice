$fn = 100;
mm = 1;
in = 25.4 * mm;
u = 1;
degree = 1;
diameter = .5;
p1=$preview?1+1/$fn:1;
use <Library_2021.scad>


Part_160();

module Part_160(){
    
    Handle();
    rotate([0, 0, 90])
        Ring();
    
    InnerRad = 45;

    NumberOfCylinders = 6;
    cylinderRadius = 5;
    OrbitalRadius = InnerRad + cylinderRadius;
    Height = 50;
    OuterRad = 55;
    Thickness = 10;

    module Ring(){
        translate([0, 0, Thickness])
            orbital_cylinders(OrbitalRadius, NumberOfCylinders, cylinderRadius, Height, Xtilt= 0, Ytilt= 0);
            annulus(OuterRad, InnerRad, Thickness);
            translate([0, 0, Thickness + Height])
                annulus(OuterRad, InnerRad, Thickness);
    }
    
    module Handle(){
        YLength = 40;
        XLength = 90;
        WallThickness = XLength - 10;
        translate([0, -YLength / 2, 0])
        difference(){
            cube([XLength, YLength, Height + (Thickness * 2)]);
            translate([0, 0, Thickness])
                cube([WallThickness, YLength, Height]);
            translate([0, Thickness, 0])
                cube([XLength, YLength / 2, Height + (Thickness * 2)]);
            translate([0, YLength / 2, 0])
            cylinder( Height + (Thickness * 2), r= InnerRad);
        }
        
        }

    }
