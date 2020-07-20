$fn = 100;
mm = 1;
degree = 1;
diameter = .5;
use <library.scad>

render(){
bent_Base();
}

module bent_Base(){
    Z_Zero_Plates();
    Leg();
    Top_Plate();
    
    baseThickness = 15;
    footDepth = 50;
    footWidth = 70;
    footDifference = 80;
    LegHeight = 55;
    overAllLength =(footDepth * 2) + footDifference ;
    
    module Z_Zero_Plates(){
        mountingCutRadius = 10;
        mountingCutOffset = 20;
        difference(){
            union(){
                cube([footDepth, footWidth, baseThickness]);
                
                translate([footDepth + footDifference, 0, 0])
                    cube([footDepth, footWidth, baseThickness]);
            }

        translate([overAllLength - mountingCutOffset, 0, 0 ])
            hull(){
                translate([mountingCutOffset, footWidth / 2, 0])
                    cylinder(baseThickness, r = mountingCutRadius );
                
                translate([0, footWidth / 2, 0])
                    cylinder(baseThickness, r = mountingCutRadius );
                    
                }
            
            hull(){
                translate([mountingCutOffset, footWidth / 2, 0])
                    cylinder(baseThickness, r = mountingCutRadius );
                
                translate([0, footWidth / 2, 0])
                    cylinder(baseThickness, r = mountingCutRadius );
                    
                }
            
        }
    }
        
    module Leg(){
        
        
        translate([ (footDepth - baseThickness), 0, 0])
            cube([baseThickness, footWidth, LegHeight]);
        
        translate([ footDepth + footDifference, 0, 0])
            cube([baseThickness, footWidth, LegHeight]);
        }
        
    module Top_Plate(){
        Top_Cylinder();
        topPlateLength = 80;
        topDiameter = 70 * diameter;
        bottumDiameter = 40 * diameter;
        cylinderHeight = 50;
        centerCylinderCutDiameter = 18 * diameter;
        
        difference(){
            translate([ footDepth, 0, LegHeight - baseThickness])
                cube([topPlateLength, footWidth, baseThickness]);
                
            translate([((footDepth * 2) + topPlateLength) /2, footWidth / 2, 0])
                cylinder((cylinderHeight + LegHeight), r = centerCylinderCutDiameter);
        }

        module Top_Cylinder(){
            firstBoreCutDiameter = 30 * diameter ;
            BoreCylinderHeight = 20;
            
            difference(){
                translate([((footDepth * 2) + topPlateLength) /2, footWidth / 2, LegHeight])
                    cylinder(cylinderHeight, bottumDiameter, topDiameter);
                
                translate([((footDepth * 2) + topPlateLength) /2, footWidth / 2, LegHeight])
                    cylinder((cylinderHeight + LegHeight), r = centerCylinderCutDiameter);
                
                translate([((footDepth * 2) + topPlateLength) /2, footWidth / 2, (LegHeight + cylinderHeight) - BoreCylinderHeight])
                    cylinder(BoreCylinderHeight, r = firstBoreCutDiameter);
                
                translate([((footDepth * 2) + topPlateLength) /2, footWidth / 2, (LegHeight + cylinderHeight) - (BoreCylinderHeight * 2)])
                    cylinder(BoreCylinderHeight, centerCylinderCutDiameter, firstBoreCutDiameter);
                
                }
                
                
                }
        }
        
    



    }
    
    
    
    
    
    
    
    
    
    
    
    
    