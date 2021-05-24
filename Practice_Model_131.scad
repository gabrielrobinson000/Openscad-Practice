$fn = 200;
mm = 1;
degree = 1;
diameter = .5;
use <Library_2021.scad>

horizontal_Cuts();

module horizontal_Cuts(){
    Vertical_Cuts();
        //these variables are used to alline bottum cylinder
        // and short cylinder cut
            outerRadius = 30 * mm;
                xOffsetCyl = 70 * mm;
                yOffsetCyl = outerRadius;
                zOffsetCyl = 4 * mm;
            //these variables are used to alline tallest cube
            //and tall cube cut
                TcubeHeigth = 40 * mm;
        //==================================================
    difference(){
        union(){
            //variables for the bottum cylinder
            outerRadius = 30 * mm;
            cylinderHeight = 8 * mm;
            translate([xOffsetCyl, yOffsetCyl, zOffsetCyl])    
                cylinder(cylinderHeight, r= outerRadius);
            //==================================
            //variables for the base cube
            cubeLength = 70 * mm;
            cubeWidth = 60  * mm;
            cubeHeight = 12 * mm;
                xOffsetCube = 0 * mm;
                yOffsetCube = 0 * mm;
                zOffsetCube = 0 * mm;
              translate([xOffsetCube, yOffsetCube, zOffsetCube])
                cube([cubeLength, cubeWidth, cubeHeight]);
            //==================================
            //variables for the middle cube
            McubeLength = 50 * mm;// hard to figure out.
            McubeWidth = cubeWidth;
            McubeHeigth = 13 * mm;
                xOffsetMCube = 0 * mm;
                yOffsetMCube = 0 * mm;
                zOffsetMCube = cubeHeight;
            translate([xOffsetMCube, yOffsetMCube, zOffsetMCube])
                cube([McubeLength, McubeWidth, McubeHeigth]);
            //==================================
            //variables for the tallest cube
            TcubeLength = 30 * mm;
            TcubeWidth = 36 * mm;
                xOffsetTCube = 0 * mm;
                yOffsetTCube = 12 * mm;
                zOffsetTCube = 0 * mm;
            translate([xOffsetTCube, yOffsetTCube, zOffsetTCube])
                cube([TcubeLength, TcubeWidth, TcubeHeigth]);
            //==================================
        }
        //short cylinder cut
        innerDiameter = 18 * mm * diameter;
        cutHeight = 12 * mm;
        translate([xOffsetCyl, yOffsetCyl, 0])
            cylinder(cutHeight, r= innerDiameter);
        //==========================================
        //tall cylinder cut
        TallCylDiameter = 15 * diameter * mm;
            xOffsetCut = (7.5 + TallCylDiameter);
            yOffsetCut = 30 * mm;
            zOffsetCut = 0 * mm;
        translate([xOffsetCut, yOffsetCut, 0])
            cylinder(TcubeHeigth, r= TallCylDiameter);
        
        //==========================================
    }
module Vertical_Cuts(){
    difference(){
            //Horizontal cylinders X offset
                CylXoffset = 10 * mm;
            //The Pillers RectHeight Z height
                RectangleHeigth = 65 * mm;
        union(){
            //The pillers 
            RectangleLength = 25 * mm;
            RectangleWidth = 12 * mm;
            RectangleHeigth = 65 * mm;
                RectXOffset = 5 * mm;
                RectYOffset = ((outerRadius * 2) -RectangleWidth);
                RectZOffset = 0 * mm;
            // The first Piller
            translate([RectXOffset, 0, 0])
                cube([RectangleLength, RectangleWidth, RectangleHeigth]);
            //The secound Piller (far piller)
            translate([RectXOffset, RectYOffset, RectZOffset])
                cube([RectangleLength, RectangleWidth, RectangleHeigth]);
            //==========================================
            //Horizontal cylinder
            HoriCylRadius = 20 * mm;
            CylYoffset = 60 - RectangleWidth;
            translate([CylXoffset, 0,RectangleHeigth])
            rotate([-90, 0, 0])
                cylinder(RectangleWidth, r= HoriCylRadius);
            //Horizontal cylinders (far piller)
            translate([CylXoffset, CylYoffset, RectangleHeigth])
            rotate([-90, 0, 0])
                cylinder(RectangleWidth, r= HoriCylRadius);            
            //==========================================
            }
        // cut variables
            cutDiameter = 20 * diameter* mm;
                cutHeight = outerRadius * 2;
        translate([CylXoffset, 0, RectangleHeigth])
        rotate([-90, 0, 0])
            cylinder(cutHeight, r= cutDiameter);            
        //=====================================================
        }
    }
}