$fn = 100;
mm = 1;
degree = 1;
diameter = .5;
angleOffset = 90;
use <library.scad>

base_Plate();


module base_Plate(){
anulusOuterRadius = 50;
anulusInnerDiameter = 35 * diameter;
baseThickness = 10;

    anulus(anulusOuterRadius, anulusInnerDiameter, baseThickness);

cubeDepth = 240;
cubeWidth = 70;
cubeHeight = 10;
    

    translate([ 0, 0, baseThickness])
        anulus();
    cylinderHeight = 60;

    
    difference(){
        translate([ 0, -cubeWidth / 2, 0])
            cube([ cubeDepth, cubeWidth, cubeHeight]);
        
        cylinder(baseThickness, r = anulusOuterRadius);
        }
    
    
    
    }

