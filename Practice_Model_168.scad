$fn = 100;
mm = 1;
in = 25.4 * mm;
u = 1;
degree = 1;
diameter = .5;
p1=$preview?1+1/$fn:1;
use <Library_2021.scad>


Part_168();

module Part_168(){

    sqHole();
    Tubes();
    
    //sqHole
    Outerside = 75;
    Innerside = 65;
    cutCylLitD = 25;
    cutCylBigD = 30;
    AnnulusLen = 115;
    AnnLenLong = Outerside + (40 * 2);
    
    OuterCylLitD = 40;
    OuterCylBigD = 45;
    
    module Tubes(){
        difference(){
            union(){
                rotate([0, 90, 0])annulus(OuterCylBigD / 2, cutCylLitD / 2, AnnulusLen, true);//Short
                rotate([90, 0, 0])annulus(OuterCylLitD / 2, cutCylBigD / 2, AnnLenLong, true);//Long
                }
            cube([Outerside, Outerside, Outerside], center= true);
            }
        }
    
    module sqHole(){
        difference(){
            cube([Outerside, Outerside, Outerside], center= true);
                cube([Innerside, Innerside, Outerside], center= true);
                rotate([0, 90, 0])cylinder(AnnulusLen, d= cutCylLitD, center = true);
                rotate([90, 0, 0])cylinder(AnnulusLen, d= cutCylBigD, center = true);
            }
    }
}