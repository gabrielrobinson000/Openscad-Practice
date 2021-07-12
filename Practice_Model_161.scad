$fn = 100;
mm = 1;
in = 25.4 * mm;
u = 1;
degree = 1;
diameter = .5;
p1=$preview?1+1/$fn:1;
use <Library_2021.scad>


Part_160();

module Part_160(){
    
    // Base Cube
    SideLength = 64;
    BaseHeight = 18;
    // Annulus Pipe
    OuterRad = 15;
    InnerRad = 6;
    TubeHeight = 35;
    // Annulus Top
    TopOuterRad = 21;
    TopTubeHeight = 5;
    //Inner Cyl Cut
    CutRadius = 11;
    CutCylHeight = 25;
    ZcutOffset = BaseHeight + 10;
    
    
    translate([SideLength / 2, SideLength / 2, BaseHeight + TubeHeight])
        annulus(TopOuterRad, InnerRad, TopTubeHeight);//Annulus Top

    difference(){
        translate([SideLength / 2, SideLength / 2, BaseHeight])
            annulus(OuterRad, InnerRad, TubeHeight);//Annulus Pipe
        translate([SideLength / 2, SideLength / 2, ZcutOffset])
            cylinder(CutCylHeight, r= CutRadius);//Inner Cyl Cut
    }
    
    difference(){// Base Cube
        cube([SideLength, SideLength, BaseHeight]);
            translate([SideLength / 2, SideLength / 2, 0])
                cylinder(BaseHeight, r= InnerRad);
      translate([SideLength / 2, SideLength, 0])rotate([90, 0, 0])linear_extrude(SideLength)Trapizoid();      
    }

    module Trapizoid(){
        Height = 5;
        OverAllDiameter = 23;//bottum Length
        TopLength = 15;
        projection(cut= true)
            rotate([-90, 0, 0])cylinder(Height, d1 = OverAllDiameter, d2 = TopLength);
        }
    }