$fn = 200;
mm = 1;
degree = 1;
diameter = .5;
use <Library_2021.scad>

rotate([90, 0, 0])
part_136();

module part_136(){
    rotate([30, 0, 0])
    translate([0, 0, -10 * mm])    
        HeadStone(20 * mm, 10 * mm, 30 * mm, 7.5 * mm, 55 * mm);
    rotate([-90, 0, 0])
        HeadStone(40 * mm, 10 * mm, 30 * mm, 7.5 * mm, 75 * mm);
    rotate([-90, 0 ,0])
    #translate([24 * mm, 0, 0]){
    hull(){
        spine(60 * mm,12 * mm, 10 * mm);
        rotate([120, 0 ,0])
        translate([0, 15.770, -10]){//15.770 is an close guess **FIX THIS LATER**
        #translate([0, -10 * mm, 0])
            spine(40 - (15.770/2) * mm,12 * mm, 10 * mm);
        translate([0, -10,0])
        spine(0 * mm,12 * mm, 10 * mm);
            }
        }
    }
    module HeadStone(OffsetLength, Zthickness, CylinderRadius, CutCylRadius, CutCylHeight){
        difference(){
            union(){
                hull(){
                    ;//true R30
                    cubeSideLength = CylinderRadius * 2;
                        yOffset = OffsetLength + CylinderRadius;
                        translate([CylinderRadius, yOffset, 0])
                            cylinder(Zthickness, r= CylinderRadius);
                        cube([cubeSideLength, cubeSideLength / 2, Zthickness]);
                }
            }
            translate([CylinderRadius,  CutCylHeight, 0])
                cylinder(Zthickness, r= CutCylRadius);
        }
    }
    module spine(Height, Width, Zthickness){
        translate([0, Height, 0])
            cube([Width, $fs / 2, Zthickness]);
        }
}