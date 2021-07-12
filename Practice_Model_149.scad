$fn = 100;
p1=$preview?1+1/$fn:1;
mm = 1;
in = 25.4 * mm;
u = 1;//
degree = 1;
diameter = .5;
use <Library_2021.scad>

Part_149();

module Part_149(){
    difference(){
        union(){
            Base();
            Cone();
        }
        Cuts();
    }
        BaseHeight = 10;
        ConeHeight = 70;
        TotalHeight = BaseHeight + ConeHeight;
    module Base(){
        Diameter = 110;
        cylinder(BaseHeight, d= Diameter);
        }
    module Cone(){
        TopDiameter= 52;
        BottumDiameter= 94;
        translate([0, 0, BaseHeight])cylinder(ConeHeight, d2= TopDiameter, d1= BottumDiameter);
        }
    module Cuts(){
        ThroughHoleDiameter = 40;
        BottumCutHeight = 33;
        BottumDiameter = 70;
        zOffset = 68;
        NotchHeight = 5;
        NotchDiameter = 50;
        cylinder(TotalHeight, d= ThroughHoleDiameter);// Through Hole
        cylinder(BottumCutHeight, d= BottumDiameter);// Bottum Cut
        #translate([0, 0, zOffset])cylinder(NotchHeight, d= NotchDiameter);//Notch Cut
        }
    }