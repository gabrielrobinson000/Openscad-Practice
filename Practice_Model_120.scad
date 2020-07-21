$fn = 100;
mm = 1;
degree = 1;
diameter = .5;
angleOffset = 90;
use <library.scad>

render(){
base_Plate();
}

module base_Plate(){

    anulusOuterRadius = 50;
    anulusInnerDiameter = 35 * diameter;
    baseThickness = 10;
    
    endCylOuterRadius = 25;

    cubeDepth = 240;
    cubeWidth = 70;
    cubeHeight = 10;
    
    cutOffset = 65;
    pipeOuterDiameter = 40 * diameter;

    plate_Body();
    upright_Pipe();
    horizontal_Cylinder();
    
    triangleHeight = 40;
    triangleLenght = 60;
    triangleDepth = 10;
    
    triMergeOffsetLenght = triangleLenght * .03;
    triMergeOffsetHeight = triangleHeight * .03;
    
    translate([cubeDepth - cutOffset - pipeOuterDiameter + triMergeOffsetLenght , -triangleDepth / 2,baseThickness - triMergeOffsetHeight])
    rotate([90, 0, 180])
        triangle(triMergeOffsetHeight + triangleHeight, triangleLenght + triMergeOffsetLenght , triangleDepth);

    anulus(anulusOuterRadius, anulusInnerDiameter, baseThickness);

    module plate_Body(){
         
        difference(){
            translate([ 0, -cubeWidth / 2, 0])
                cube([ cubeDepth, cubeWidth, cubeHeight]);
            
            cylinder(baseThickness, r = anulusOuterRadius);
        
        translate([ cubeDepth - endCylOuterRadius * 1.8, -cubeWidth / 2, 0])
                cube([endCylOuterRadius * 2, cubeWidth, cubeHeight]);
            }
        }

    module upright_Pipe(){
        cylinderHeight = 60;
        pipeInnerDiameter = 15 * diameter;
            
            translate([ cubeDepth - cutOffset, 0, baseThickness])
                anulus(pipeOuterDiameter,pipeInnerDiameter, cylinderHeight);
    }

    module horizontal_Cylinder(){
        
        pipeInnerDiameter = 10 * diameter;
        
        difference(){
            translate([ cubeDepth - endCylOuterRadius, -cubeWidth / 2, cubeHeight])
            rotate([ -90, 0, 0])
                anulus(endCylOuterRadius, pipeInnerDiameter, cubeWidth);
        
            translate([ endCylOuterRadius, -cubeWidth / 2, -endCylOuterRadius])
                cube([ cubeDepth, cubeWidth, endCylOuterRadius]);

            }
        }
    
    
    
    
    }

