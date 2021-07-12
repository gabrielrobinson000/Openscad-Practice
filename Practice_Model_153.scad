$fn = 100;
mm = 1;
in = 25.4 * mm;
u = 1;
degree = 1;
diameter = .5;
p1=$preview?1+1/$fn:1;
use <Library_2021.scad>

Part_153();

module Part_153(){
    translate([0, 100, 0])SmallAnnulus(InnerRadius= 0);
    translate([120, 0, 0])SmallAnnulus();
    LargeAnnulus();
    Shortcube();
    LongCube();
    
    SmallAnulusOuterRadius = 35;
    Height = 50;
    
    module SmallAnnulus(InnerRadius){
        OuterRadius = SmallAnulusOuterRadius * diameter;
        InnerRadius = 25 * diameter;
        translate([0,0,-Height / 2])annulus(OuterRadius, InnerRadius, Height);
        }

    module LargeAnnulus(InnerRadius){
        OuterRadius = 45 * diameter;
        InnerRadius = 35 * diameter;
        Height = 50;
        translate([0,0,-Height / 2])annulus(OuterRadius, InnerRadius, Height);
        }

    module Shortcube(){
        baseXZ = 25;
        baseY = 100;
        //cube cut
        cutLength = 40;
        cutHeight = 15;
            centering = (baseY - cutLength) / 2;
        
        difference(){
            translate([-SmallAnulusOuterRadius / 2, 0, -baseXZ / 2])cube([SmallAnulusOuterRadius, baseY, baseXZ]);
            
            translate([0, 0,-Height / 2])cylinder(Height, d= SmallAnulusOuterRadius);
            translate([0, baseY, -Height / 2])cylinder(Height, d= SmallAnulusOuterRadius);
            
            translate([-SmallAnulusOuterRadius / 2, centering,-cutHeight / 2])cube([SmallAnulusOuterRadius, cutLength, cutHeight]);//cube cut
            }
        }
    module LongCube(){
        baseYZ = 25;
        baseX = 120;
        //cube cut
        cutLength = 60;
        cutHeight = 15;
        centering = (baseX - cutLength) / 2;
        
        difference(){
            translate([0, -SmallAnulusOuterRadius / 2,  -baseYZ / 2])cube([baseX, SmallAnulusOuterRadius, baseYZ]);
            
            translate([0, 0, -Height / 2])cylinder(Height, d= SmallAnulusOuterRadius);
            translate([baseX, 0, -Height / 2])cylinder(Height, d= SmallAnulusOuterRadius);
            
            #translate([centering, -SmallAnulusOuterRadius / 2, -cutHeight / 2])cube([cutLength, SmallAnulusOuterRadius, cutHeight]);//cube cut
            }
        }
    }