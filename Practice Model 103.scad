
//Variables 
mainCylinderHeight = 50;
mainCylinderRadius = 25;
cylinderDiameterCut = 20;
lengthOfPart = 125;
heightcubeCut = 50;
widthCubeCut = 50;
depthCubeCut = 20;
offsetOfCube = 20;



difference(){
    hull(){
        cylinder(mainCylinderHeight, r = mainCylinderRadius, r = mainCylinderRadius);// main Cylinder

        translate([lengthOfPart, mainCylinderHeight / 2, mainCylinderHeight / 2])
        rotate([0, 90, -90])
        cylinder(mainCylinderHeight, r = mainCylinderRadius, r = mainCylinderRadius);// main Cylinder rotated and translated
    }
    
     cylinder(mainCylinderHeight, d = cylinderDiameterCut, d = cylinderDiameterCut);// main cut Cylinder 

        translate([lengthOfPart, mainCylinderHeight / 2, mainCylinderHeight / 2])
        rotate([0, 90, -90])
        cylinder(mainCylinderHeight,  d = cylinderDiameterCut,  d = cylinderDiameterCut);// main cut Cylinder rotated and translated
    
    
        translate([ lengthOfPart-mainCylinderRadius,-offsetOfCube / 2, 0])
        rotate([0, 0, 0])
        cube( [widthCubeCut,  depthCubeCut, widthCubeCut]);// cube cut  translated
        
        translate([ -mainCylinderRadius, -mainCylinderRadius, (mainCylinderHeight /2)-(offsetOfCube / 2)])
        rotate([ 0, 0, 0])
        cube( [ widthCubeCut ,widthCubeCut, depthCubeCut]);// main cube cut
}