basecylinderRadius = 75;
basecylinderDepth = 20;
partLengthCtoC = 180;

chungeussHeight = 60;
chungeussRadius = 35;
chungeussOffset = basecylinderDepth ;

offTheTopChungusCutRadius = 20;
cutOffTheTopCylinder = basecylinderDepth  + chungeussHeight - 30;

totalHeightCylCut = basecylinderDepth  + chungeussHeight;
chungeussDiameter = 15;
middleCylCutHole = partLengthCtoC / 2;
TandBtotalLength = 110;

mountChungeussDiameter = 20;


//main code
difference(){  
  union(){
    hull(){

        cylinder(basecylinderDepth, r = basecylinderRadius);
        
        translate([0, partLengthCtoC, 0])
        cylinder(basecylinderDepth, r = basecylinderRadius);
    }

    hull(){

        translate([ 0, 0, chungeussOffset])
        cylinder(chungeussHeight, r = chungeussRadius);
        
        translate([ 0, partLengthCtoC, chungeussOffset])
        cylinder(chungeussHeight, r = chungeussRadius);
    }
}
 hull(){

        translate([ 0, 0, cutOffTheTopCylinder])
        cylinder(chungeussHeight, r = offTheTopChungusCutRadius);
        
        translate([ 0, partLengthCtoC, cutOffTheTopCylinder])
        cylinder(chungeussHeight, r = offTheTopChungusCutRadius);
 }

//The center three cylinders---------------------------------
    cylinder(chungeussHeight, d = chungeussDiameter);
    
    translate([0, middleCylCutHole, 0])
    cylinder(chungeussHeight, d = chungeussDiameter);
    
    translate([0, middleCylCutHole * 2, 0])
    cylinder(chungeussHeight, d = chungeussDiameter);
 //---------------------------------------------------------
 //The + X offset three cylinders---------------------------------
     translate([TandBtotalLength / 2, 0, 0])
     cylinder(chungeussHeight, d = mountChungeussDiameter);
    
    translate([TandBtotalLength / 2, middleCylCutHole, 0])
    cylinder(chungeussHeight, d = mountChungeussDiameter);
    
    translate([TandBtotalLength / 2, middleCylCutHole * 2, 0])
    cylinder(chungeussHeight, d = mountChungeussDiameter);
 //---------------------------------------------------------------
  //The  X offset three cylinders---------------------------------
     translate([-TandBtotalLength / 2, 0, 0])
     cylinder(chungeussHeight, d = mountChungeussDiameter);
    
    translate([-TandBtotalLength / 2, middleCylCutHole, 0])
    cylinder(chungeussHeight, d = mountChungeussDiameter);
    
    translate([-TandBtotalLength / 2, middleCylCutHole * 2, 0])
    cylinder(chungeussHeight, d = mountChungeussDiameter);
 //---------------------------------------------------------------
}