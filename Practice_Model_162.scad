$fn = 100;
mm = 1;
in = 25.4 * mm;
u = 1;
degree = 1;
diameter = .5;
p1=$preview?1+1/$fn:1;
use <Library_2021.scad>


Part_162();

module Part_162(){
    
    PlateMounts();
    translate([0, 0, PlateThickness])rotate([0, 0, 180])
        orbital_cylinders(OrbitalRadius, NumberOfCylinders, cylinderRadius, Height, Xtilt, Ytilt);
    translate([0, 0, PlateThickness + Height])PlateMounts();
    
    OrbitalRadius = 35;
    NumberOfCylinders = 3;
    cylinderRadius = 2.5;
    Height = 20;
    Xtilt = 0;
    Ytilt = 0;
    
    PlateThickness = 10;
    
    OuterRad = 40;
    InnerRad = 32.5;
    
    module PlateMounts(){
        NumberOfCylinders = 3;
        MaxDiameter = 110 * u;
        OuterRadiusMounts = 12.5 * u;
        InnerRadiusMounts = 7.5 * u;
        for (Hole = [0:NumberOfCylinders]){
            rotate([0, 0, 360/NumberOfCylinders * Hole]){
                difference(){
                        union(){
                    translate([0, -OuterRadiusMounts, 0])
                        cube([(MaxDiameter / 2),OuterRadiusMounts * 2, PlateThickness]);
                    translate([MaxDiameter /2, 0, 0])
                        cylinder(PlateThickness, r= OuterRadiusMounts);
                     annulus(OuterRad, InnerRad, PlateThickness);
                        }
                    translate([MaxDiameter /2, 0, 0])
                        cylinder(PlateThickness, r= InnerRadiusMounts);
                    cylinder(PlateThickness, r= InnerRad);
                    }
                }
            }
        }
    }