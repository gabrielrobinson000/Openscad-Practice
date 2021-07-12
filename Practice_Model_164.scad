$fn = 100;
mm = 1;
in = 25.4 * mm;
u = 1;
degree = 1;
diameter = .5;
p1=$preview?1+1/$fn:1;
use <Library_2021.scad>


Part_164();

module Part_164(){
    
    annulus(centerRad, EdgeRad, OverAllHeight, true);
    difference(){
        Base();
            Cuts();
        cube([40, 80, 80], center= true);
    }
    
    
        OverAllHeight = 60;
        xOffset = 95;
        centerRad = 35;
        EdgeRad = 20;
    
        centerCutRad = 20;
    
    module Base(){

        cutCubeZ = 40;
        
        difference(){
            union(){
                hull(){
                #cylinder(OverAllHeight, r= centerRad, center = true);// Center
                #translate([xOffset, 0, 0])cylinder(OverAllHeight, r= EdgeRad, center = true);//Right
                #translate([-xOffset, 0, 0])cylinder(OverAllHeight, r= EdgeRad, center = true);//Left
                }
            }
            cube([xOffset * 2.75, OverAllHeight * 2, cutCubeZ], center = true);
        }
    }
    module Cuts(){
        
        edgeCutRad = 10;
        xOuterEdgeCut = 63;
        CutLocationY = 32.10526315789474+ 51.75;
        
        #translate([xOuterEdgeCut, CutLocationY, 0])cylinder(OverAllHeight, r= 70, center= true);
        #mirror([1, 0, 0])translate([xOuterEdgeCut, CutLocationY, 0])cylinder(OverAllHeight, r= 70, center= true);
        #mirror([0, 1, 0])translate([xOuterEdgeCut, CutLocationY, 0])cylinder(OverAllHeight, r= 70, center= true);
        #mirror([1, 0, 0])mirror([0, 1, 0])translate([xOuterEdgeCut, CutLocationY, 0])cylinder(OverAllHeight, r= 70, center= true);
        
        #translate([xOffset, 0, 0])cylinder(OverAllHeight, r= edgeCutRad, center= true);//Cyl Right cut
        cylinder(OverAllHeight, r= centerCutRad, center= true);//Cyl Center cut
        #translate([-xOffset, 0, 0])cylinder(OverAllHeight, r= edgeCutRad, center= true);//Cyl Left cut
        }
}