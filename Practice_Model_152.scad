$fn = 100;
mm = 1;
in = 25.4 * mm;
u = 1;
degree = 1;
diameter = .5;
p1=$preview?1+1/$fn:1;
use <Library_2021.scad>

Part_152();

module Part_152(){
    
    Plate();
    
    //Plate Values
        PlateLength = 95;
        PlateWidth = 60;
        PlateDepth = 10;
    
    module Plate(){cube([PlateDepth, PlateLength, PlateWidth]);}

    // Shape location values
    Yoffset = 28.09;
    //#translate([ 0, PlateLength - Yoffset, PlateWidth])cube([40, Yoffset, 1]);
    
    translate([PlateDepth, Yoffset, 0])rotate([32.2755, 0, 0])Shape();
    
    module Shape(){
        
        cubeBaseX = 40;
        cubeBaseY = 64.8615;
        cubeBaseZ = 30;
        
        difference(){
            cube([cubeBaseX, cubeBaseY, cubeBaseZ]);
                Cuts();
            }
        
        module Cuts(){
            notchOffsetX = 10;

            notchCutWidth = 7.5;
            notchCutDepth = 6;            
            
            trapHeightbase = 16;
            trapHeighttop = 5;
            
            trapDepth = 15;
            trapZoffset = 7.5;
            
            core = ($fn/$fn);
            notsurewhattocallthis = (core / 2);
            
            #translate([notchOffsetX, 0, 0])notch();//Bottom Cut
            #translate([notchOffsetX, 0, cubeBaseZ - notchCutDepth])notch();//Top Cut
            #translate([cubeBaseX - trapDepth,0,trapZoffset])trap();
            
            module notch(){cube([notchCutWidth, cubeBaseY, notchCutDepth]);}
            module trap(){
                translate([trapDepth + core, cubeBaseY / 2, trapHeightbase / 2])
                    rotate([0, 180, 0])
                        hull(){
                            translate([notsurewhattocallthis, 0, 0])cube([$fn/$fn, cubeBaseY, trapHeightbase], true);
                            translate([notsurewhattocallthis + trapDepth, 0, 0])cube([$fn/$fn, cubeBaseY, trapHeighttop], true);
                            
                            }
                }
            }
        }
    }