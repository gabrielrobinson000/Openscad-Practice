$fn = 100;
mm = 1;
degree = 1;
diameter = .5;
angleOffset = 90;
use <library.scad>

translate([0, 0, 54])
rotate([0, -90, 0])
    part_121();



module part_121(){
    chainLink();
    anulusTag();
    D_annulus();
    little_Cube();
   
    //chainlinkPlate
    plateDepth = 54;
    plateHeight = 8;
    
    outerRadius = 14;
    chainThickness = 10;


    module chainLink(){
        //chainLink
        
        innerRadius = 6;
        chainThickness = 8;
        betweenCenters = 20;

anulus(outerRadius, innerRadius, chainThickness, betweenCenters);
        difference(){
            rotate([0, 0, 180])
                cube_cut(plateDepth,outerRadius * 2, plateHeight, 0, - outerRadius , 0);
            
            anulus(outerRadius, 0, chainThickness, betweenCenters);
                }
            }

    module anulusTag(){
        
        innerDiameter = 12 *  diameter;
        tagPlateDepth = 28;

        translate([- plateDepth + chainThickness, 0, -tagPlateDepth])
        rotate([0, -90, 0])
            anulus(outerRadius, innerDiameter, chainThickness, 0);// UI warning object
        
        difference(){
            translate([- plateDepth + chainThickness, -outerRadius, -tagPlateDepth])
            rotate([0, -90, 0])
                cube([tagPlateDepth, outerRadius * 2, chainThickness]);
            
            translate([- plateDepth + chainThickness, 0, -tagPlateDepth])
            rotate([0, -90, 0])
                cylinder(chainThickness, r = outerRadius);
            }
        }

    module D_annulus(){
        
        innerDiameter = 12 *  diameter;
        cylCubeDepth = 18;

            translate([- plateDepth + outerRadius ,  outerRadius,cylCubeDepth + outerRadius / 2])
            rotate([90, 0, 0])
                anulus(outerRadius, innerDiameter, outerRadius * 2,0);
        
        difference(){
            translate([-plateDepth, -outerRadius,plateHeight])
            cube([outerRadius * 2, outerRadius * 2, cylCubeDepth]);
            
            translate([- plateDepth + outerRadius ,  outerRadius,cylCubeDepth  + outerRadius / 2])
            rotate([90, 0, 0])
                cylinder(outerRadius * 2, r = outerRadius);
        }
        }


    module little_Cube(){
        Depth = 6; 
        Height = 7;
        disFromPlateD = 23;
        
        translate([-plateDepth + chainThickness+ disFromPlateD, -outerRadius , -Height])
            cube([Depth, outerRadius * 2, Height]);
        
        
        }
        }                          



             
                   