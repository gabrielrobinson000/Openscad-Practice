$fn = 200;
mm = 1;
degree = 1;
diameter = .5;
use <Library_2021.scad>

model_133();

module model_133(){
    Height = 120 * mm;
    difference(){
        base();
        Cuts();
        }
    module base(){
        Length = 120 * mm;
        Width = 80 * mm;
        cube([Length, Width, Height], center= true);
        cube([Width, Length, Height], center= true);
        
        }
    module Cuts(){
        CenterDiameter = 20 * mm;
            cylinder(Height,d=CenterDiameter, center= true );// Center cut
        BigCylCut = 30 * mm;
        translate([Height / 2, 0, 0])
            cylinder(Height,r= BigCylCut, center= true);// Big cylinder cut
        LittleCut = 12.50 * mm;
        translate([-(Height / 2), 0, 0])
            cylinder(Height,r=LittleCut, center= true);// little cylinder side cut
        sides = 50 * mm;
        cube([sides, Height, sides], center = true);
        }
    }