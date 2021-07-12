$fn = 100;
mm = 1;
in = 25.4 * mm;
u = 1;
degree = 1;
diameter = .5;
p1=$preview?1+1/$fn:1;
use <Library_2021.scad>


Part_166();

module Part_166(){

    bentTrap();

    module bentTrap(){
        baseCubeX = 100;
        baseCubeY = 90;
        baseCubeZ = 50;
        
        cutCubeX = 55;
        cutCubeY = 60;
        cutShiftY = 15;
        
        triCutHeightLeft = 20;
        triCutHeightRight = 35;
        
        InnerRad = 10;
        OuterRad = 15;
        cylHeight = 60;
        
        diffThick = 10;
        
        thetaRight = atan(baseCubeZ / triCutHeightRight);
        thetaLeft = atan(baseCubeZ / triCutHeightLeft);
        difference(){
            union(){
                difference(){
                    cube([baseCubeX, baseCubeY, baseCubeZ]);
                    translate([0, 0, baseCubeZ])rotate([-90, 0, 0])linear_extrude(baseCubeX){
                       polygon(points = [[0, 0],[triCutHeightLeft, 0], [0, baseCubeZ]]);
                        translate([baseCubeX, 0, 0])polygon(points = [[0, 0],  [-triCutHeightRight, 0], [0, baseCubeZ]]);
                        }
                    translate([baseCubeX - cutCubeX, cutShiftY, 0])cube([cutCubeX, cutCubeY, baseCubeZ]);
                    translate([baseCubeX - cutCubeX, baseCubeY / 2, 0])cylinder(cylHeight, r= OuterRad);
                    }
                    translate([baseCubeX - cutCubeX, baseCubeY / 2, 0])annulus(OuterRad, InnerRad, cylHeight);
                }
                !translate([10,0, diffThick])
                    difference(){
                        cube([baseCubeX - (diffThick * 2), baseCubeY, baseCubeZ - (diffThick * 2)]);
                        #translate([0, 0, (baseCubeZ- (diffThick * 2))])rotate([-90, 0, 0])linear_extrude(baseCubeX){
                           polygon(points = [[0, 0],[triCutHeightLeft, 0], [0, baseCubeZ]]);
                            translate([baseCubeX - (diffThick * 2), 0, 0])polygon(points = [[0, 0],  [-triCutHeightRight, 0], [0, baseCubeZ]]);
                        }
        }
                        
    }
        }
    }