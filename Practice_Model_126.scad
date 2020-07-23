$fn = 100;
mm = 1;
degree = 1;
diameter = .5;
use <library.scad>

rotate([90, 0, 0])
    Part_126();

module Part_126(){
    
    OffsetFromBase = 15;
    InterSpace = 50;
    
        BigCylInnerDiameter = 60 * diameter;
        BigAnulusInnerCutDiameter = 35 * diameter;
        
        LittleCylInnerDiameter = 25 * diameter;
        LittleAnulusInnerCutDiameter = 10 * diameter;
        
        anulusHeight = 96;
        CenterToCenter = 130;
    
    translate([0, 0, OffsetFromBase])
        plate();
    
     translate([0, 0, OffsetFromBase + InterSpace])
        plate();

        anulus(BigCylInnerDiameter, BigAnulusInnerCutDiameter, anulusHeight);

     translate([CenterToCenter, 0, 0])   
        anulus(LittleCylInnerDiameter, LittleAnulusInnerCutDiameter, anulusHeight);

    module plate(){
        CylHeight = 8;
        BigCylOuterRadius = 40;
        BigCylInnerDiameter = 60 * diameter;
        LittleCylOuterRadius = 20;
        LittleCylInnerDiameter = 25 * diameter;
        
    difference(){ 
        hull(){
                cylinder(CylHeight, r = BigCylOuterRadius);
            
            translate([CenterToCenter, 0, 0])
                cylinder(CylHeight, r = LittleCylOuterRadius);
                
                }

                cylinder(CylHeight, r = BigCylInnerDiameter);

            translate([CenterToCenter, 0, 0])
                cylinder(CylHeight, r = LittleCylInnerDiameter);

            }
        }
    }