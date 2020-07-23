$fn = 100;
mm = 1;
degree = 1;
diameter = .5;
angleOffset = 90;
use <library.scad>

part_124();

module part_124(){
    arcDistance = 100;
    bentAngle = 90;
    innerDiameter = 45 * diameter;  
    outerbentpipeDiameter = 50 * diameter;    

        translate([outerbentpipeDiameter / 2 + arcDistance , 0, 0])
            basePlate();
        
        translate([0, 0, outerbentpipeDiameter / 2 + arcDistance])
            Zmount();
        
    module basePlate(){
        ObitalDistance = 70 * diameter;
        NumberOfCylinders = 4;
        cylinderRadius = 10 * diameter;
        cylinderHeight = 10;
        difference(){
            outerDiameter = 90 * diameter;

                anulus(outerDiameter, innerDiameter, cylinderHeight);
                
                orbital_cylinders(ObitalDistance ,NumberOfCylinders , cylinderRadius, cylinderHeight);
                    }
                        }
        
        rotate([90, 0, 0])
            bent_pipe( outerbentpipeDiameter, innerDiameter,outerbentpipeDiameter / 2 + arcDistance , bentAngle);

    module Zmount(){
        ZmountHeight = 10;
        centerCylRadius = 35;
        ObitalDistance = 65;
        NumberOfCylinders = 2;
        cylinderRadius = 15;
        
         cylinderRadiusCut = 15 * diameter;
        
    rotate([90, 0, 90])
        difference(){
            hull(){
                cylinder(ZmountHeight, r = centerCylRadius);
                
                orbital_cylinders(ObitalDistance ,NumberOfCylinders , cylinderRadius, ZmountHeight);
                }
                cylinder(ZmountHeight, r = innerDiameter);
                
                orbital_cylinders(ObitalDistance ,NumberOfCylinders , cylinderRadiusCut, ZmountHeight);
                
                }
        }
}