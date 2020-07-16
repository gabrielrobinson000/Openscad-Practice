//The Variable bank ------------------------------------------------

//All of the Base Values--------------------------------------------
    //Cube Base vaules
    cubeBaseWidth = 200;
    cubeBaseLength = 500;
    cubeBaseDepth = 50;

    // Mirrored Cylinder Cut Holes
    MirroredCylinderRadius = 30;
    CylinderInnerLength = 60;
        //Mirrored Cylinder Cut Holes Translations
        MirroredCylinderX = 100;
        MirroredCylinderY = 60;
        betweenCutsHoleDistance = 380;
        
    //Center Cylinder Cut Hole
    CenterCylinderRadius = 40;
    CenterCylinderCutDepth = 30;
    CenterCylinderBetweenLength = 100;
        //Center Cylinder Cut Hole Translations
        CenterCylinderX = 100;
        CenterCylinderY = 250;
        CenterCylinderZ = 20;
        
    //Double cube Cut
    cubeCutLength = 150;
    cubeCutDepth = 10;
        //Double Cube Translations
        DDCubeZHigh= 40;
        DDCubeZLow = 25;
        
   
//The end of base Values ---------------------------------------------
    
  
// Values for the back Plate -----------------------------------------
    //Back Plate Cylinder Values
        BackPlateInnerDiameter = 100;
        BackPlateOuterRadius = 100;
        BackPlateDepth = 30;
        //Back Plate Cube Values
        BackPlateCubeWidth = 150;
        BackPlateCubeLength = 200;
            //Translations For the cylinder & Cube
            CubeTransY = 150;
            CylinderTransY = 250;
            CylinderTransZ = 150;

// The End of Values for the Back Plate ------------------------------



// The main parts -----------------------------------------------------

// The Base Mount -----------------------------------------------------

difference(){
    cube([cubeBaseWidth, cubeBaseLength, cubeBaseDepth ]); //Main Mount Cube
    
    hull(){ // Center Cylinder Cut
        translate([CenterCylinderX, CenterCylinderY, CenterCylinderZ])
        cylinder(CenterCylinderCutDepth , r = CenterCylinderRadius); 
        
        translate([CenterCylinderX + CenterCylinderBetweenLength, CenterCylinderY, CenterCylinderZ])
        cylinder(CenterCylinderCutDepth , r = CenterCylinderRadius);
    }
    
    hull(){ // The first mirror cut
        translate([MirroredCylinderX, 0, 0])
        cylinder(cubeBaseDepth, r = MirroredCylinderRadius);
       
        translate([MirroredCylinderX, MirroredCylinderY , 0])
        cylinder(cubeBaseDepth, r = MirroredCylinderRadius);
        };
        
     translate([0,betweenCutsHoleDistance + MirroredCylinderY, 0])
     hull(){ // The Mirrored Cut
         translate([MirroredCylinderX, MirroredCylinderY, 0])
         cylinder(cubeBaseDepth, r = MirroredCylinderRadius);
          
         translate([MirroredCylinderX,  0, 0])
         cylinder(cubeBaseDepth, r = MirroredCylinderRadius);
        }
     
   hull(){
     translate([0, 0, DDCubeZHigh])
     cube([BackPlateCubeLength, cubeCutLength, cubeCutDepth]);
     
     translate([0, -cubeCutLength, DDCubeZLow])
     cube([BackPlateCubeLength, cubeCutLength, cubeCutDepth]);
       }
   
   hull(){    
     translate([0, cubeBaseLength - cubeCutLength, DDCubeZHigh])
     cube([BackPlateCubeLength, cubeCutLength, cubeCutDepth]);
       
       translate([0, cubeBaseLength, DDCubeZLow])
     cube([BackPlateCubeLength, cubeCutLength, cubeCutDepth]);
   }
        
}
// The End of the Base Mount-------------------------------------------
difference(){
    union(){
        translate([0, CubeTransY, 0])
        cube([BackPlateDepth, BackPlateCubeLength, BackPlateCubeWidth]);
        
        rotate([0, 90, 0])
        translate([-CylinderTransZ, CylinderTransY, 0])
        cylinder(BackPlateDepth, r = BackPlateOuterRadius);
    }
    
    rotate([0, 90, 0])
    translate([-CylinderTransZ, CylinderTransY, 0])
    cylinder(BackPlateDepth, d = BackPlateInnerDiameter);
    
    }

// The Back Mount -----------------------------------------------------

// The End of the Back Mount ------------------------------------------

//The End of the Main Parts ------------------------------------------