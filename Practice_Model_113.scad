$fn = 100;
mm = 1;
degree = 1;
diameter = .5;
use <library.scad>

//anulus base values
outerRadius = 40 * mm;
innerRadius  = 30 * mm;
cylinderHeight = 50 * mm;

//anulus arm
outerArmRadius =  15 * mm;
innerArmDiameter = 14 * mm * diameter;
cylinderArmHeight = 20 * mm;
    armOffsetX = cylinderHeight / 2;
    armOffsetY = 55 * mm;

//buttom centered cube cut 
notchedOutCube = (2 *innerRadius) + (outerRadius - innerRadius);

//outer tangent cube 
cubediff = 5 * mm;
cubeHeightZ = 10 * mm;
outercubeDepth = 30 * mm;
outercubeWidth = 40 *mm;
innercubeDepth = outercubeDepth - (cubediff * 2);
innercubeWidth = outercubeWidth - (cubediff * 2);
 anulusCubeZshift = cubeHeightZ / 2 + outerRadius;

//inner tangent cube
tangentcubeThickness = outerRadius - innerRadius;
    anulusCubeZshiftInner = cubeHeightZ / 2 + innerRadius;

//top cylinder cut 
topCylCutDiameter = 15 * mm * diameter;
    
    
//the main objects
translate([ cylinderHeight / 2, 0,anulusCubeZshift])
anulus_cube( outercubeDepth, outercubeWidth, innercubeDepth, innercubeWidth, cubeHeightZ);// top center hollow cube

difference(){
    translate([ cylinderHeight / 2, 0,anulusCubeZshiftInner])
    cube([outercubeDepth,outercubeWidth,tangentcubeThickness], true);//connecting cube between anullus_cube and anulus cylinder base
    
    translate([cylinderHeight / 2, 0, 0])
    cylinder(outerRadius, r = topCylCutDiameter);//top cylinder cut 
    }


difference(){
    rotate([0, 90, 0])
    anulus(outerRadius, innerRadius, cylinderHeight);

    translate([0, - outerRadius, -outerRadius])
    cube([ cylinderHeight, outerRadius * 2, outerRadius]);// cuts away have of the anulus away
    
    translate([0, -(notchedOutCube) /2 , 0])
    cube([ cylinderHeight , notchedOutCube,(outerRadius - innerRadius) / 2]);
    
    translate([cylinderHeight / 2, 0, 0])
    cylinder(outerRadius, r = topCylCutDiameter);
}

union(){
    difference(){
        mirror([0, -90, 0])
        translate([cylinderHeight / 2 - outerArmRadius, innerRadius,0])
        cube([ 2 * outerArmRadius, 2*(outerRadius - innerRadius) + innerArmDiameter, cylinderArmHeight]);

        mirror([0, -90, 0])
        translate([armOffsetX, armOffsetY, 0])
        cylinder(r =outerArmRadius, cylinderArmHeight);
        
        translate([0, -(notchedOutCube) /2 , 0])
        cube([ cylinderHeight , notchedOutCube,(outerRadius - innerRadius) / 2]);
    }
mirror([0, -90, 0])
translate([armOffsetX, armOffsetY, 0])
anulus(outerArmRadius, innerArmDiameter, cylinderArmHeight);
}

union(){
    difference(){
        translate([cylinderHeight / 2 - outerArmRadius, innerRadius,0])
        cube([ 2 * outerArmRadius, 2*(outerRadius - innerRadius) + innerArmDiameter, cylinderArmHeight]);

        translate([armOffsetX, armOffsetY, 0])
        cylinder(r =outerArmRadius, cylinderArmHeight);
        
        translate([0, -(notchedOutCube) /2 , 0])
        cube([ cylinderHeight , notchedOutCube,(outerRadius - innerRadius) / 2]);
   
    }
translate([armOffsetX, armOffsetY, 0])
anulus(outerArmRadius, innerArmDiameter, cylinderArmHeight);
}
