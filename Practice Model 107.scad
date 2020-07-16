// Base Cylinder
baseCylinderHeight = 20;
baseCylinderDiameter = 120;
    //translations
        baseCylinderZ = baseCylinderHeight;

//Cylinder Mounting Hole Values
baseCylCutMountHolesDiameter = 12;
baseCylOffsetRadiusX = 45;
baseCylMountCutDepth = baseCylinderHeight;

//Main Shaft        
longCylinderHeight = 130;
longCylinderDiameter = 60;

//Short Shaft
smallerLongCylinderHeight = 50;
smallerLongCylinderDiameter = 30;

//Inside Cylinder Cuts Bigger
biggerInsideCutsHeight = 144;
biggerInsideCutsDiameter = 48;

//Top Cube Block
cubeDepth = 20;
cubeCornercylinderRadiusOutside = 10;
cubeCornercylinderDiameterInside = 10;
    //Translation for the Top Cube Block
    cubeShiftUpZ = baseCylinderHeight + longCylinderHeight;
    outsideYoffsetCylCut = 45;

//Inside Cylinder Cuts Smaller
smallerInsideCutsHeight = (smallerLongCylinderHeight + cubeDepth);
smallerInsideCutsDiameter = 18;


//Code for the Part

difference(){
    cylinder(baseCylinderHeight, d = baseCylinderDiameter);//Base cylinder
    
    cylinder(biggerInsideCutsHeight, d = biggerInsideCutsDiameter); //The Big Cut
    
    for ( hole = [0:360/4:360]){
    rotate([ 0, 0, hole])
    translate([baseCylOffsetRadiusX, 0, 0])
    cylinder(baseCylMountCutDepth, d = baseCylCutMountHolesDiameter);
    }//Mounting Hole Cuts
 }
         
difference(){
    translate([ 0, 0, baseCylinderZ])
    cylinder(longCylinderHeight, d = longCylinderDiameter);//The Main Cylinder 

    cylinder(biggerInsideCutsHeight, d = biggerInsideCutsDiameter); //The Big Cut

    cylinder( longCylinderHeight + baseCylinderHeight + smallerLongCylinderHeight, d = smallerInsideCutsDiameter);//The Little Cut
}

difference(){
    translate([ 0, 0,baseCylinderHeight + longCylinderHeight])
    cylinder(smallerLongCylinderHeight, d = smallerLongCylinderDiameter);//The Little long Cylinder

    cylinder( longCylinderHeight + baseCylinderHeight + smallerLongCylinderHeight, d = smallerInsideCutsDiameter);//The Little Cut

    
}


difference(){
    hull(){
        for ( corner = [0:360/4:360]){
            rotate([ 0, 0, corner + outsideYoffsetCylCut])
            translate([baseCylOffsetRadiusX, 0, baseCylinderHeight + longCylinderHeight + smallerLongCylinderHeight])
            cylinder(baseCylMountCutDepth, r = cubeCornercylinderRadiusOutside);// The Top Cube 
        }
    }
        
    for ( corner = [0:360/4:360]){
            rotate([ 0, 0, corner + outsideYoffsetCylCut])
            translate([baseCylOffsetRadiusX, 0, baseCylinderHeight + longCylinderHeight + smallerLongCylinderHeight])
            cylinder(baseCylMountCutDepth, d = cubeCornercylinderDiameterInside);// The Top Cube Cuts
        
        }
    
    cylinder( longCylinderHeight + baseCylinderHeight + smallerLongCylinderHeight + cubeDepth, d = smallerInsideCutsDiameter);//The Little Cut
    }
