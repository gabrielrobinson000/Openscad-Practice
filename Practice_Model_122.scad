$fn = 100;
mm = 1;
degree = 1;
diameter = .5;
angleOffset = 90;
use <library.scad>

render(){
    Part_122();
    }

module Part_122(){
    
    main_Pipe();
    Tangent_mounts();
    pinch_mount();
    

    outerRadiusPipe = 55;
    cylHeightPipe   = 280;

    tanCutWidth = 50 / 2;
    TanCutHeight = sqrt((outerRadiusPipe * outerRadiusPipe) - (tanCutWidth *tanCutWidth));
  
    module main_Pipe(){
        
        innerRadius = 40;
        cubeDepth = 20;
        
        rotate([0, -90,180])
        difference(){
            anulus_hull(outerRadiusPipe, innerRadius, cylHeightPipe, 0);
            
            translate([ 0, -cubeDepth / 2, 0])
                cube([outerRadiusPipe, cubeDepth, cylHeightPipe]);
            
            translate([ TanCutHeight, -outerRadiusPipe / 2, 0])
                cube([cubeDepth, outerRadiusPipe, cylHeightPipe]);    
            }
    }
    
    module Tangent_mounts(){
        outerRadius = 30;
        innerRadius = 30 * diameter;
        cylHeight   = 15;
        CenterDif   = 180;
        
        difference(){
            rotate([0, 0, 90])
            translate([-CenterDif / 2, -outerRadius, -outerRadiusPipe])
                anulus_hull(outerRadius, 0, cylHeight, CenterDif);
            
            translate([outerRadius, CenterDif / 2,- outerRadiusPipe ])
                cylinder(cylHeight, r = innerRadius);
            
            translate([outerRadius, -CenterDif / 2,- outerRadiusPipe ])
                cylinder(cylHeight, r = innerRadius);
    }

        difference(){
            rotate([0, 0, 90])
            translate([-CenterDif / 2,- cylHeightPipe + outerRadius, -outerRadiusPipe])
                anulus_hull(outerRadius, 0, cylHeight, CenterDif);

            translate([cylHeightPipe - outerRadius, CenterDif / 2,- outerRadiusPipe ])
                cylinder(cylHeight, r = innerRadius);
            
            translate([cylHeightPipe - outerRadius, -CenterDif / 2,- outerRadiusPipe ])
                cylinder(cylHeight, r = innerRadius);
            }
        }                                 

    module pinch_mount(){
        outerPinchRadius = 30;
        innerPinchDiameter = 30 * diameter;
        cubePinchHeight = 30;
        
        pinchDepth = 15;
        pinchShiftY = 10;
        
        pinchShiftX = 70;
        
        pinch_Right();
        pinch_Left();
        
            module pinch_Left(){
        translate([pinchShiftX, pinchShiftY, TanCutHeight + outerPinchRadius])
        rotate([-90, 0, 0])
            anulus_hull(outerPinchRadius,innerPinchDiameter, pinchDepth, 0 );// back

                difference(){
                    translate([pinchShiftX - outerPinchRadius, pinchShiftY, TanCutHeight])
                        cube([cubePinchHeight * 2, pinchDepth, cubePinchHeight ]);

                    translate([pinchShiftX, pinchShiftY, TanCutHeight + outerPinchRadius])
                        rotate([-90, 0, 0])
                            anulus_hull(outerPinchRadius,0, pinchDepth, 0 );// back
                    }

        translate([cylHeightPipe - pinchShiftX, pinchShiftY, TanCutHeight + outerPinchRadius])
        rotate([-90, 0, 0])
            anulus_hull(outerPinchRadius,innerPinchDiameter, pinchDepth, 0 );//front
                
                difference(){
                   translate([cylHeightPipe - pinchShiftX - outerPinchRadius, pinchShiftY, TanCutHeight])
                        cube([cubePinchHeight * 2, pinchDepth, cubePinchHeight ]);

                    translate([cylHeightPipe - pinchShiftX, pinchShiftY, TanCutHeight + outerPinchRadius])
                        rotate([-90, 0, 0])
                            anulus_hull(outerPinchRadius, 0, pinchDepth, 0 );//front
                            }
                }

            module pinch_Right(){
                translate([0, - pinchShiftY * 3.5, 0])    
                pinch_Left();
                }
        }
}