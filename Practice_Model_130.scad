$fn = 100;
mm = 1;
degree = 1;
diameter = .5;
use <library.scad>


    StockDepth = 250;
    StockWidth = 75;
    StockHeight = 125;

difference(){
StockBlock();

TopCubeCut();
BottumTCut();
MiddleCubeCuts();

}    
module StockBlock(){
    
    cube([StockDepth, StockWidth, StockHeight]);
    }                

module TopCubeCut(){
    NotchDepth = 10;
    NotchHeight = 15;
    OffsetX = 12.5;
    
    translate([OffsetX, 0, StockHeight - NotchHeight])
        cube([NotchDepth, StockWidth, NotchHeight]);

    translate([StockDepth - OffsetX - NotchDepth, 0, StockHeight - NotchHeight])
        cube([NotchDepth, StockWidth, NotchHeight]);
    
}

module MiddleCubeCuts(){
    centerDepth = 18;
    centerHeight = 18;
    Zoffset = 42;
    
    translate([StockDepth /2 - centerDepth / 2, 0, Zoffset])
        cube([centerDepth, StockWidth, centerHeight + StockHeight]);
    
    ObitalDistance = 180 * diameter;
    NumberOfCylinders = 2;
    cylinderRadius = 25 * diameter;
    
    translate([StockDepth / 2, 0, Zoffset])
      rotate([-90, 0, 0])
        orbital_cylinders(ObitalDistance ,NumberOfCylinders , cylinderRadius, StockWidth);

    triangleLength = 70;
    XTriShift = 35;
    CentercubeDepth = 40;
    translate([XTriShift + triangleLength, 0, Zoffset + centerHeight])
        cube([CentercubeDepth, StockWidth, StockHeight]);
   
   triangleCut();
    module triangleCut(){
        triangleHeight = StockHeight - Zoffset - centerHeight;
        
        
        
        
        translate([XTriShift + triangleLength, 0, StockHeight])
        rotate([0, 90, 90])
           triangle(triangleLength, triangleHeight, StockWidth);
        
        XTriShiftLong = XTriShift + triangleLength;
        
        translate([StockDepth - XTriShiftLong , StockWidth, StockHeight])
        rotate([0, 90, -90])
            triangle(triangleLength, triangleHeight, StockWidth);
        }
    }

module BottumTCut(){
    TbodyWidth = 20;
    TbodyHeight = 13;
    YOffsetbody = 27.5;
    
    translate([0, YOffsetbody, 0])
        cube([StockDepth, TbodyWidth, TbodyHeight]);
    
    TCrossWidth = 35;
    TCrossHeight = 5;
    YOffsetCross = 20;
    ZOffsetCross = 8;
    
    translate([0, YOffsetCross, ZOffsetCross])
        cube([StockDepth, TCrossWidth, TCrossHeight]);
    }
    
