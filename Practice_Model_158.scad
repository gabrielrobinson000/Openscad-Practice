$fn = 100;
mm = 1;
in = 25.4 * mm;
u = 1;
degree = 1;
diameter = .5;
p1=$preview?1+1/$fn:1;
use <Library_2021.scad>

Part_158();

module Part_158(){
    baseX = 80;
    baseY = 120;
    baseZ = 80;
    cube([baseX, baseY, baseZ], true);
    
    stud = 50;
    cylinderDiameter = 35;
    rotate([90, 0, 0])cylinder(baseY + (stud * 2), d= cylinderDiameter, center = true);
    
    mountThickness = 20;
    mountOnTopHeight = 40;
    Yoffset = (baseY / 2) - mountThickness -10;
    outerRadius = 40;
    innerDiameter = 35 * diameter;
    difference(){
        union(){
            translate([-baseX / 2, Yoffset, -baseZ / 2])cube([baseX, mountThickness, baseZ + mountOnTopHeight]);
            mirror([0, 1, 0])translate([-baseX / 2, Yoffset, -baseZ / 2])cube([baseX, mountThickness, baseZ + mountOnTopHeight]);
        }
        translate([0, Yoffset, baseZ])rotate([-90, 0, 0])cylinder(mountThickness, r= outerRadius);
        mirror([0, 1, 0])translate([0, Yoffset, baseZ])rotate([-90, 0, 0])cylinder(mountThickness, r= outerRadius);
    }
    translate([0, Yoffset, baseZ])rotate([-90, 0, 0])annulus(outerRadius, innerDiameter, mountThickness);
    mirror([0, 1, 0])translate([0, Yoffset, baseZ])rotate([-90, 0, 0])annulus(outerRadius, innerDiameter, mountThickness);
    
}