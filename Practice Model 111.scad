
mainCylinderRadius = 52.50;
mainCylinderDepth = 20;
mainCylinderCenterDiameterCut = 30;

cylinderGuideThroughHoleDiameter = 80;
cylinderRadiusThroughCuts = 12;
NumberOfCylinders = 7;

cubeHeight = 80;
cubeWidth = 175;
cubeDepth = 10;
    translatecubeX = -cubeHeight / 2;
    translatecubeY = -cubeWidth / 2;
    translatecubeZ = 90 ;

strutLegHeight = 10;
strutLegWidth = 10;
strutLegDepth = 90;
    strutLegTransX = (cubeHeight / 2) - strutLegHeight;
    strutLegTransY = (cubeWidth / 2) - strutLegWidth;
    strutLegTransZ = 0;
    

//Main Objects
difference(){
    union(){
        cylinder(mainCylinderDepth, r = mainCylinderRadius);//Main cylinder
        Strut();
        rotate(180)Strut();
        mirror([1,0,0])Strut();
        mirror([0,1,0])Strut();
    }

cylinder(mainCylinderDepth, d = mainCylinderCenterDiameterCut);

rotate(90)orbital_cuts();
}

translate([translatecubeX, translatecubeY, translatecubeZ - cubeDepth])
cube([cubeHeight, cubeWidth, cubeDepth]);//back plate

module Strut(){
    translate([strutLegTransX, strutLegTransY, strutLegTransZ])
    cube([strutLegHeight, strutLegWidth, strutLegDepth]);// orignal srtut leg

    translate([strutLegTransX, strutLegTransY, strutLegTransZ])
    rotate([90, 0, 0])
    cube([strutLegHeight, mainCylinderDepth, strutLegDepth]);// orignal strut
}

module orbital_cuts(){
    for (Holes = [0:360/NumberOfCylinders:360] ){
        rotate([0, 0, Holes])
        translate([cylinderGuideThroughHoleDiameter / 2, 0, 0])
        cylinder(mainCylinderDepth, d = cylinderRadiusThroughCuts );
        }// hehe cuts circles in a circle
}













