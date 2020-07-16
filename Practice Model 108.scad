$fn = 100;
//Base Cube
cubeLength = 200;
cubeWidth = 50;
cubeDepth = 15;

//Perpendicular Cube 
PCubeDepth = 20;
PCubeWidth = 250;
PCubeLength = 250;
    //Translations for the Perpendicular Cube
    PCOffsetX = 50;
    PCOffsetY = 50;
    PCOffsetY2 = PCubeWidth - PCOffsetY;
    PCOffsetXOffTop = PCubeLength + cubeDepth - 25;
//Triangle Lengths
TriLength = 100;
TriDepth = 100;
TriOffset = 17.50;
TriWidth = 15;

//Perpendicular Cylinder Cut Big
PCylinderCutDepth = PCubeDepth;
PCylinderCutRadius = 195.30;

//Perpendicular Cylinder Cut Small
PCylinderSmallCutRadius = 11.75;

//The Main Code Block
cube([cubeLength, cubeWidth, cubeDepth]);

difference(){
    translate([PCOffsetX , 0, cubeDepth])
    cube([PCubeDepth, PCubeWidth, PCubeLength]);
    
    translate([PCOffsetX , cubeWidth + PCylinderCutRadius, cubeDepth]) 
    rotate([ 0, 90, 0])
    cylinder(PCylinderCutDepth, r = PCylinderCutRadius);
    
    hull(){
        translate([PCOffsetX ,PCOffsetY , PCOffsetXOffTop]) 
        rotate([ 0, 90, 0])
        cylinder(PCylinderCutDepth, r = PCylinderSmallCutRadius);
        
        translate([PCOffsetX ,PCOffsetY2 , PCOffsetXOffTop]) 
        rotate([ 0, 90, 0])
        cylinder(PCylinderCutDepth, r = PCylinderSmallCutRadius);
        }
}
translate([PCubeDepth + PCOffsetX, TriOffset + TriWidth, cubeDepth])
rotate([ 90, 0, 0])
linear_extrude(TriWidth)
polygon(points = [[ 0, 0],[ TriLength, 0], [ 0, TriDepth], [ 0, 0]]);


