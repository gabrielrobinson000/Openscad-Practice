
//-------------------------------------------------------------
//VARIABLE LIST BLOCK
    
//Base Rectangle postive object
baseRectLength = 150;
baseRectWidth = 100;
baseRectDepth = 20;

//Base Rectangle negitive object (cutting object)
baseRectLengthCut = 150;
baseRectWidthCut = 60;
baseRectDepthCut = 10;

//Mounting cutouts negative object (cutting object)
baseCircularRadiusCut = 7.50;
baseCircularCutLength = 15;
    //translation
    theXoffset = 20;

//The Mounting Cube
cubeWidth = 100;
cubeDepth = 80;
cubeHeight = 80;
    //cube translations
    cubeXoffset = 0;
    cubeYoffset = 35;
    cubeZoffset = 20;

//Mounting Cube Cuts
cubeWidthCut = 100;
cubeDepthCut = 60;
cubeHeightCut = 60;
    //cube translations Cuts
    cubeXoffsetCut = 10;
    cubeYoffsetCut = 45;
    cubeZoffsetCut = 30;

//Diaganol Cut
DiagcubeWidthCut = 100;
DiagcubeDepthCut = 80;
DiagcubeHeightCut = 110;
    //Diaganol Translations Cuts
    DiagXoffsetCut = 100;
    DiagYoffsetCut = 35;
    DiagZoffsetCut = 40;
    DiagCutAngle = -53.1285;

// hole cut
circularDiameterCut = 30;
circularDiameterDepthCut = 10;
    //hole cut Translations
    circularYoffsetCut = 75;
    circularZoffsetCut = 60;
//------------------------------------------------------------ 

//Parts


//------------------------------------------------------------
//THE BASE
difference(){
    cube([ baseRectWidth, baseRectLength, baseRectDepth]);
    
    translate([theXoffset, 0, 0])
    cube([ baseRectWidthCut, baseRectLengthCut, baseRectDepthCut]);
    
    
    hull(){
        translate([baseRectWidth / 2, baseCircularCutLength, 0])
        cylinder(baseRectDepth,r = baseCircularRadiusCut, false);
    
        translate([baseRectWidth / 2, 0, 0])
        cylinder(baseRectDepth,r = baseCircularRadiusCut, false);
        } 
        
        
    translate([0, baseRectLength, 0])
    hull(){
         translate([baseRectWidth / 2, -baseCircularCutLength, 0])
         cylinder(baseRectDepth,r = baseCircularRadiusCut, false);
        
         translate([baseRectWidth / 2, 0, 0])
         cylinder(baseRectDepth,r = baseCircularRadiusCut, false);
            }
}
//------------------------------------------------------------
//THETOP BLOCK
difference(){
    translate([cubeXoffset, cubeYoffset, cubeZoffset])
    cube([ cubeWidth, cubeDepth, cubeHeight]);

        translate([cubeXoffsetCut, cubeYoffsetCut, cubeZoffsetCut])
        cube([ cubeWidthCut, cubeDepthCut, cubeHeightCut]);

        translate([DiagXoffsetCut, DiagYoffsetCut, DiagZoffsetCut])
        rotate([0, DiagCutAngle , 0]) //the angle is more than likely wrong.
        cube([ DiagcubeWidthCut, DiagcubeDepthCut, DiagcubeHeightCut]);
    
        translate([ 0, circularYoffsetCut, circularZoffsetCut])
        rotate([0, 90, 0])
        cylinder(circularDiameterDepthCut, d = circularDiameterCut, false);
}