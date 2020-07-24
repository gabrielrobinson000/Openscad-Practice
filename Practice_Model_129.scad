$fn = 100;
mm = 1;
degree = 1;
diameter = .5;
use <library.scad>

/*
translate([0,(160-35)/2,65])
cube([5,35,5]);
translate([0,0,-10])
cube([5,OverAllLength,5]);

rotate([0,-90])
projection(cut = true)
rotate([0,90])
translate([-50,0,0]){
     */


OverAllLength = 160;
PlateWidth = 50;
PlateDepth = 125;
PlateHeight = 10;
TopCubeZoffset = 60;

render(){
Plate();
translate([0, OverAllLength - PlateWidth, 0])
    Plate();
VPlate();
VPlate();
}

module Plate(){

    
    ObitalDistance = 75 * diameter;
    NumberOfCylinders = 2;
    cylinderRadius = 20 * diameter;
    
    difference(){
        cube([PlateDepth, PlateWidth, PlateHeight]);
        
        translate([PlateDepth / 2, PlateWidth / 2, 0])
            orbital_cylinders(ObitalDistance ,NumberOfCylinders , cylinderRadius, PlateHeight);  
        }
    }
    
module VPlate(){
    TopCubeWidth = 35;
    centerDifference = OverAllLength - PlateWidth * 2 - TopCubeWidth;
    
    translate([0,PlateWidth + 12.5 , TopCubeZoffset - PlateHeight])
        cube([PlateDepth, TopCubeWidth, PlateHeight]);
    
    difference(){
        union(){
            hull(){//Left incline
                translate([0, PlateWidth + 12.5 , TopCubeZoffset - PlateHeight])
                    cube([PlateDepth, PlateHeight, PlateHeight]);

                translate([0, PlateWidth, 0])
                    cube([PlateDepth, PlateHeight, PlateHeight]);
            }
            
            hull(){//Right incline
                translate([0, OverAllLength - PlateWidth - PlateHeight - 12.5 , TopCubeZoffset - PlateHeight])
                    cube([PlateDepth, PlateHeight, PlateHeight]);
                translate([0, OverAllLength - PlateWidth - PlateHeight , 0])
                    cube([PlateDepth, PlateHeight, PlateHeight]);
            }
    }
        CutCubeDepth = 50;
        CutCubeHeight = 25;
        OffTheTopCut = 15;
        Xoffset      = 37.5;
            translate([Xoffset, 0, TopCubeZoffset - OffTheTopCut - CutCubeHeight])
                cube([CutCubeDepth, OverAllLength, CutCubeHeight]);
}
}