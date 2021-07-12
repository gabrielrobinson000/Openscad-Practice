$fn = 100;
mm = 1;
degree = 1;
diameter = .5;
use <Library_2021.scad>

Part_142();

module Part_142(){
    difference(){
        difference(){
            BasePlate();
            rotate([0, 0, 45])
            translate([0, 0, CubeMountThickness / 2])
                cube([InnerCutLength, InnerCutLength, CubeMountThickness + BaseZHeight], center= true);
        }
        WallCuts();
    }
    CubeMount();
        BaseXLength = 60 * mm;
        BaseYDepth = 120 * mm;
        BaseZHeight = 10 * mm;
        
        WallHeight = 50 * mm;
    module BasePlate(){
            ParallelWalls();
        difference(){
                cube([BaseXLength, BaseYDepth, BaseZHeight], center= true);
            OrbitalRadius = 15 * mm;
            NumberOfCylinders = 4;
            cylinderRadius = 6 * mm;
            Height = BaseZHeight;
            Xtilt = 0;
            Ytilt = 0;
            #rotate([0, 0, 45])
            translate([0, 0, -Height / 2])
                orbital_cylinders(OrbitalRadius, NumberOfCylinders, cylinderRadius, Height, Xtilt, Ytilt);
        }
        module ParallelWalls(){
            translate([-BaseXLength / 2, BaseYDepth / 2 - BaseZHeight, 0])
                cube([BaseXLength, BaseZHeight, WallHeight], center= false);
            
            mirror([0, 1, 0])
            translate([-BaseXLength / 2, BaseYDepth / 2 - BaseZHeight, 0])
                cube([BaseXLength, BaseZHeight, WallHeight], center= false);
            }
        }
        SideLength = 30 * mm;
        CubeMountThickness = 10 * mm;
        InnerCutLength = 12 * mm;
    module CubeMount(){
        rotate([0, 0, 45])
        translate([0, 0, CubeMountThickness / 2])
            difference(){
            cube([SideLength, SideLength, CubeMountThickness + BaseZHeight], center= true);
                cube([InnerCutLength, InnerCutLength, CubeMountThickness + BaseZHeight], center= true);
            }
        }
    module WallCuts(){
        OuterRadius = 7.5 * mm;
        InnerRadius = 0 * mm;
        BetweenCenters = 15 * mm;
        CeintureZHeight =  WallHeight + (BetweenCenters - (OuterRadius * 2));
        translate([0, BaseYDepth / 2, CeintureZHeight])
        rotate([90,90,0])
            ceinture(OuterRadius, InnerRadius, BaseYDepth, BetweenCenters);
    }

    }