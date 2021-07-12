$fn = 100;
mm = 1;
degree = 1;
diameter = .5;
use <Library_2021.scad>

Part_141();

module Part_141(){
    Horizontal_Annulus();
    difference(){
        Base();
            CubeCuts();
            CyliCuts();
        OuterRadius = 8 * mm;
        InnerRadius = 0;
        Height = 15 * mm;
        BetweenCenters = 20 * mm;
        cientureOffsetZ = 47.5;
        #rotate([0, 90, 0])
        translate([(Zoffset - BaseZ), BaseY / 2, cientureOffsetZ])
            ceinture(OuterRadius, InnerRadius, Height, BetweenCenters);
    }
    //Extrenal measurements for the base cube
    BaseX = 95 * mm;
    BaseY = 60 * mm;
    BaseZ = 90 * mm;
    Zoffset = 14 * mm;
    module Base(){
        translate([0, 0, -Zoffset])
            cube([BaseX, BaseY, BaseZ]);
        }
        //Cylinder Variables
        BigCylRadius = 35 * mm;
        SmallCylRadius = 20 * mm; 
    module CyliCuts(){
        //Big Cylinder
        rotate([-90, 0, 0])
        translate([Cube1Thickness, -BigCylRadius, 0])
            cylinder(BaseY, r= BigCylRadius);
        //Small Cylinder
        rotate([-90, 0, 0])
        translate([BaseX - Cube1Thickness, -SmallCylRadius, 0])
            cylinder(BaseY, r= SmallCylRadius);
        }
        Cube1Thickness = 12.5 * mm;
    module CubeCuts(){
        //cube1
        Cube1Height = BaseZ - Zoffset;
                cube([Cube1Thickness, BaseY, Cube1Height]);
        //cube2
        Cube2Thickness = SmallCylRadius + Cube1Thickness;
        Cube2Height = 70 * mm;
        Cube2Zoffset = BaseZ - Cube2Height;
        Cube2Xoffset = BaseX - Cube2Thickness;
            translate([Cube2Xoffset, 0, Cube2Zoffset])
                cube([Cube2Thickness, BaseY, Cube2Height]);
        //cube3
        Cube3Thickness = 30 * mm + Cube1Thickness;//Guess
        Cube3Height = 55 * mm;
        Cube3Zoffset = BaseZ - Cube3Height;
            translate([0, 0, Cube3Zoffset])
                cube([Cube3Thickness + Cube1Thickness / 2.5, BaseY, Cube3Height]);
        //cube4
        Cube4Thickness = Cube1Thickness;
        Cube4Height = BaseZ - Zoffset;
        Cube4Xoffset = 0;
            translate([BaseX - Cube4Thickness, 0, 0])
                cube([Cube1Thickness, BaseY, Cube1Height]);
        //Bottum cube
        ZHeight = 6;
        XLength = 15;
        BottumCubeCut = 40;
        translate([BottumCubeCut, 0, -Zoffset])
            cube([XLength, BaseY, ZHeight]);
        }
    module Horizontal_Annulus(){
        OuterRadius = 10 * mm;
        InnerRadius = 5 * mm;
        Height = (50 - 14) * mm;
        OffsetX = 30 * mm;
        YOffset = 60 * mm;
        difference(){
            hull(){
                translate([OffsetX, BaseY / 2, 0])
                    cylinder(Height, r= OuterRadius);
                CubeLength = 1 * mm;//number just needs to be [0, 10]
                CubeWidth = OuterRadius * 2;
                CubeHeight = Height;
                translate([YOffset, OffsetX - OuterRadius, 0])
                    cube([CubeLength, CubeWidth, CubeHeight]);
                }
                translate([OffsetX, BaseY / 2, 0])
                    cylinder(Height, r= InnerRadius);            
        }
        }
    }