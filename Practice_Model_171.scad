$fn = 100;
mm = 1;
in = 25.4 * mm;
u = 1;
degree = 1;
diameter = .5;
p1=$preview?1+1/$fn:1;
use <Library_2021.scad>


Part_171();

module Part_171(){
    baseCylHeight = 100;
    baseCyliameter = 40;
    
    cubeThickness = 10;
    cubeHeight = 50;
    cylCutDiameter = 15;
    
    longCubeLeng = 100;
    
    holeOffsetFromCenter = 30;
    holeLocatOffset = 10;
    holeDiameter = 10;
    
    translate([0,0, -100])rotate([0,0, 180])HandleNShaft();
    
    module HandleNShaft(){
        difference(){
            cylinder(baseCylHeight, d= baseCyliameter, center= true);
                rotate([90, 0, 90])cylinder(baseCyliameter, d= cylCutDiameter, center= true);
        }
        translate([-baseCyliameter / 2, -cubeThickness / 2, baseCylHeight / 2])cube([baseCyliameter, cubeThickness, cubeHeight]);
        translate([-baseCyliameter / 2, -cubeThickness / 2, baseCylHeight])
            rotate([-30, 0, 0])
                cube([baseCyliameter, cubeThickness, longCubeLeng]);
        }
    translate([-cubeThickness / 2, cubeThickness / 2, 0])
        rotate([30, 0, 0])
            difference(){
                cube([cubeThickness, cubeThickness * 2, longCubeLeng]);
                    rotate([0, 90, 0]){
                        translate([(-longCubeLeng / 2), holeLocatOffset, 0])cylinder(cubeThickness, d= holeDiameter);
                        translate([(-longCubeLeng / 2) + holeOffsetFromCenter, holeLocatOffset, 0])cylinder(cubeThickness, d= holeDiameter);
                        translate([(-longCubeLeng / 2) - holeOffsetFromCenter, holeLocatOffset, 0])cylinder(cubeThickness, d= holeDiameter);
            }
    }
}