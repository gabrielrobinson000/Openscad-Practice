$fn = 100;
mm = 1;
degree = 1;
diameter = .5;
use <library.scad>

    StockCubeDepth = 210;
    StockCubeWidth = 75;
    StockCubeHeight = 130;

difference(){
    StockCube();
        firstCut();
        SecondCut();
}
TeethAdded();

module StockCube(){
    cube([StockCubeDepth, StockCubeWidth, StockCubeHeight]);
    }
    
module firstCut(){
    cutHeight = 100;
    cutDepth = 130;
    
    translate([StockCubeDepth - cutDepth, 0, StockCubeHeight - cutHeight])
        cube([cutDepth, StockCubeWidth, cutHeight]);
    
    triangleLength = 65;
    triangleHeight = 20;
    translate([StockCubeDepth - cutDepth + triangleLength, 0, StockCubeHeight - cutHeight])
    rotate([0, 90, 90])
        triangle(triangleLength, triangleHeight, StockCubeWidth);
    
        translate([StockCubeDepth - triangleLength, StockCubeWidth, StockCubeHeight - cutHeight])
    rotate([0, 90, -90])
        triangle(triangleLength, triangleHeight, StockCubeWidth);
    }
    
module SecondCut(){
    Xoffset = 10;
    Zoffset = 30;
    CutHeight2 = 90;
    CutDepth2 = 60;
    
    translate([Xoffset, 0, Zoffset])
        cube([CutDepth2, StockCubeWidth, CutHeight2]);
    
    TopOffsetX = 30;
    OffTheTopDepth = 20;
    OffTheTopHeight = 10;
    TopOffsetZ = StockCubeHeight - OffTheTopHeight;
    
    translate([TopOffsetX, 0, TopOffsetZ])
        cube([OffTheTopDepth, StockCubeWidth, OffTheTopHeight]);
    }

module TeethAdded(){
   triangleLength = 30;
   triangleHeight = 10;
   Xoffset = 30;
   Xoffset2 = 50;
    
    translate([Xoffset, 0, StockCubeHeight - triangleHeight])
    rotate([-90, 90, 0])
        triangle(triangleHeight, triangleLength, StockCubeWidth);

    translate([Xoffset2, StockCubeWidth, StockCubeHeight - triangleHeight])
    rotate([-90, 90, 180])
        triangle(triangleHeight, triangleLength, StockCubeWidth);

    }