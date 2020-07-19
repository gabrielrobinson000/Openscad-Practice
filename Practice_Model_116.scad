$fn = 100;
mm = 1;
degree = 1;
diameter = .5;
use <library.scad>

back_plate();
middle_block();
base_Plate();

//Global variables
backCubeWidth = 70;
backCubeDepth = 30;

middleBlockDepth = 70;
middleBlockHeight = 30;
outerDiameter = 35 * diameter;
innerDiameter = 15 * diameter;


module back_plate(){
    backCubHeight = 60;
    cutRadius     = 10;   
    
    difference(){
        cube([backCubeDepth, backCubeWidth, backCubHeight]);
        
        translate([ 0, cutRadius, backCubHeight - cutRadius])
            rotate([0, -90, 180])
                rounded_corner(cutRadius, backCubeDepth);
        
        translate([ backCubeDepth, backCubeWidth - cutRadius, backCubHeight - cutRadius])
            rotate([0, -90, 0])
                rounded_corner(cutRadius, backCubeDepth);
        
        translate([0, outerDiameter, middleBlockHeight])
            rotate([0, 90, 0])
                cylinder(middleBlockDepth, r = innerDiameter,true);        

        translate([0, outerDiameter * 3, middleBlockHeight])
            rotate([0, 90, 0])
                cylinder(middleBlockDepth, r = innerDiameter,true);  
    }
    
}



module middle_block(){
    middleBlockDepth = 70;
    middleBlockHeight = 30;
    outerDiameter = 35 * diameter;
    innerDiameter = 15 * diameter;
    
translate([backCubeDepth, outerDiameter, middleBlockHeight])
    rotate([0, 90, 0])
        anulus(outerDiameter, innerDiameter, middleBlockDepth);        

translate([backCubeDepth, outerDiameter * 3, middleBlockHeight])
    rotate([0, 90, 0])
        anulus(outerDiameter, innerDiameter, middleBlockDepth);    

    difference(){
        translate([backCubeDepth, 0, 0])
            cube([middleBlockDepth, backCubeWidth, middleBlockHeight]);
        
        translate([backCubeDepth, outerDiameter, middleBlockHeight])
            rotate([0, 90, 0])
                 cylinder(middleBlockDepth, r = outerDiameter,true);        
        
        translate([backCubeDepth, outerDiameter * 3, middleBlockHeight])
            rotate([0, 90, 0])
                cylinder(middleBlockDepth, r = outerDiameter,true);        
        
        }
    }

module base_Plate(){
    basePlateDepth = 170;
    basePlateHeight = 12;
    innerCylRaduisCut = 10;
    outerRadius = 17.5;
    cutOffsetFromFront = 35;
    cutOffsetFromBack = 125;
    
    difference(){
        translate([basePlateDepth - cutOffsetFromFront, 0, basePlateHeight])
            rotate([-90, 0, 0])
                anulus(outerRadius, innerCylRaduisCut, backCubeWidth);
        
        translate([cutOffsetFromBack - (outerRadius / 2), 0, -basePlateHeight])
            cube([outerRadius * 2, backCubeWidth, basePlateHeight * 2]);
    }
    
    difference(){
        cube([basePlateDepth, backCubeWidth, basePlateHeight]);
        
        translate([cutOffsetFromBack, 0, 0])
            cube([innerCylRaduisCut * 2, backCubeWidth, basePlateHeight]);
        
        
            
    }
} 


