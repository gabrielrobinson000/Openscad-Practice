$fn = 100;
mm = 1;
in = 25.4 * mm;
u = 1;
degree = 1;
diameter = .5;
p1=$preview?1+1/$fn:1;
use <Library_2021.scad>


Part_167();

module Part_167(){
    
    // Base cube values
    baseCubeX = 125;
    baseCubeY = 40;
    baseCubeZ = 55;
    //Base Cuts
        //cube cut
        cutCubeDepth = 30;
            cutZoffset = 8;
        cutCubeHeight = baseCubeZ - (cutZoffset * 2);
        //cylinder cut
        cylYoffset = 15;
        litCylLoc = baseCubeY - cylYoffset;
        bigCylRad = 15;
        litCylRad = 5;
    
    //annulus values
    OuterRad = 15;
    InnerRad = 10;
    
    // annulus cube values
    AnnOffset = 4.5;
    annWalThick = 5;
    outerXlength = 35;
    outerYlength = 30;
    innerXlength = 25 ;
    innerYlength = 20;
        
    difference(){
        cube([baseCubeX, baseCubeY, baseCubeZ]);
        translate([0, 0, cutZoffset])cube([baseCubeX, cutCubeDepth, cutCubeHeight]);
        translate([baseCubeX / 2, 0,0])cylinder(baseCubeZ, r= bigCylRad);
        translate([baseCubeX / 2, litCylLoc,0])cylinder(baseCubeZ, r= litCylRad);
        }
    intersection(){
        cube([baseCubeX, baseCubeY, baseCubeZ]);
        rotate([-90, 0, 0])translate([baseCubeX, -(baseCubeZ / 2), 0])annulus(OuterRad, InnerRad, baseCubeY);
        }
        translate([0,0, AnnOffset + cutZoffset])SqHole();
        
    module SqHole(){
        difference(){
            cube([outerXlength, baseCubeY, outerYlength]);
            translate([0, 0, annWalThick])cube([innerXlength + annWalThick, baseCubeY, innerYlength]);
            }

        }
    }