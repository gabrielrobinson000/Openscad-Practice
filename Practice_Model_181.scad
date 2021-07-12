$fn = 100;
mm = 1;
in = 25.4 * mm;
u = 1;
degree = 1;
diameter = .5;
p1=$preview?1+1/$fn:1;
use <Library_2021.scad>


Part_181();

module Part_181(){
    
    Plates();
    translate([0, 0, plateThickness])annulus(annulusOuterD, annulusInnerD, annulusHeight);
    translate([HoleToHoleDist, 0, plateThickness])annulus(annulusOuterD, annulusInnerD, annulusHeight);
    translate([0, 0, plateThickness + annulusHeight])Plates();    

        annulusOuterD = 16 * diameter;
        annulusInnerD = 8 * diameter;
        annulusHeight = 15;

        plateThickness = 3.5;
        HoleToHoleDist = 50.80;
        plateOuterD = 24;
        plateInnerD = 8;
                
    module Plates(){
        difference(){
            hull(){
                cylinder(plateThickness, d= plateOuterD);
                translate([HoleToHoleDist, 0, 0])cylinder(plateThickness, d= plateOuterD);
                }
            cylinder(plateThickness, d= plateInnerD);
            translate([HoleToHoleDist, 0, 0])cylinder(plateThickness, d= plateInnerD);
            }
    }
}