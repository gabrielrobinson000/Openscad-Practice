$fn = 100;
mm = 1;
degree = 1;
diameter = .5;
use <Library_2021.scad>

Part_137();

module Part_137(){
    baseCube();
        Length = 60 * mm;
        Width = 100 * mm;    
    module baseCube(){
        Step();

        Height = 50 * mm;
            difference(){
                cutWidth = 30 * mm;
                cutHeight = 15 * mm;
                cutRadius = 30 * mm;
                cube([Length, Width, Height]);
                    Xoffset = 15 * mm;
                    translate([Xoffset, 0, Height - cutHeight])
                        cube([cutWidth, Width, cutHeight]);
                    translate([0, Width / 2, Height])
                    rotate([-90, 0, -90])
                        cylinder(Length, r= cutRadius);
                }
    }                
    module Step(){
        foot = 20 * mm;
        footHeight = 10 * mm;
        Yoffset = 30 * mm;
        Zoffset = 2 * mm;
        FootCutWidth = 40 * mm;
        difference(){
            cube([Length + foot, Width, footHeight]);// the cube that is foot.
            translate([0, Yoffset, Zoffset])
                cube([Length + foot, FootCutWidth, footHeight]);// Center cube cut on the foot
            translate([Length + foot, Width, 0])
             rotate([0, -45, 180])
                cube([Length + foot, Width, footHeight]);// Does the sloped cut on the foot
            }
        }
            

}