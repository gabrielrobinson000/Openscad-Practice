$fn = 100;
p1=$preview?1+1/$fn:1;
mm = 1;
in = 25.4 * mm;
u = 1;//
degree = 1;
diameter = .5;
use <Library_2021.scad>

//projection(cut=true) rotate([90,0,0]) Part_147();
Part_147();

module Part_147(){

    //BasePlate Bindings
        PlateThickness = 8 * u;
    //CenterAnnulus Bindings
        CenterInnerRadius = 15 * diameter * u;
        CenterOuterRadius = 20 * diameter * u;
    //RoundWall Bindings
        InnerRadius = 80 * diameter * u;
    //Fins Bindings
        TotalHeight = 40 * u;
difference(){
    union(){
        BasePlate();
        RoundWall();
        CenterAnnulus();
        PlateMounts();
        #Fins();
        }
        cylinder(TotalHeight, r= CenterInnerRadius);// Center plate through hole cut
        
    }

    
    module BasePlate(){
            PlateRadius = 52.50 * u;
        cylinder(PlateThickness, r= PlateRadius);
        }
    module RoundWall(){
        OuterRadius = 90 * diameter * u;
        WallHeightZ = 32 * u;
        translate([0, 0, PlateThickness])
            annulus(OuterRadius, InnerRadius, WallHeightZ);
        }
    module CenterAnnulus(){
        CenterWallHeightZ = 23 * u;
        translate([0, 0, PlateThickness])
            annulus(CenterOuterRadius, CenterInnerRadius, CenterWallHeightZ);
        }
    module Fins(){
        NumberOfCylinders = 6;
        FinThickness = 5 * u;
        FinOffTopOuter = 5 * u;
        FinOffTopInner = 17 * u;
        FinHeightOuter = (TotalHeight - FinOffTopOuter);
        FinHeightInner = (TotalHeight - FinOffTopInner);
        Origin = [0, 0];
        BottumCorner = [InnerRadius, 0];
        OuterTopCorner = [InnerRadius, FinHeightOuter];
        InnerTopCorner = [0, FinHeightInner];
        
        for (Hole = [0:NumberOfCylinders]){
            rotate([90, 0, 360/NumberOfCylinders * Hole])
            translate([0, 0,- (FinThickness / 2)])
                linear_extrude(height= FinThickness)
                    polygon( points = [Origin, BottumCorner, OuterTopCorner, InnerTopCorner]);
            }
        }
        
    module PlateMounts(){
        NumberOfCylinders = 3;
        MaxDiameter = 135 * u;
        OuterRadiusMounts = 10 * u;
        InnerRadiusMounts = 7.8 * diameter * u;
        for (Hole = [0:NumberOfCylinders]){
            rotate([0, 0, 360/NumberOfCylinders * Hole]){
                difference(){
                        union(){
                    translate([0, -OuterRadiusMounts, 0])
                        cube([(MaxDiameter / 2),OuterRadiusMounts * 2, PlateThickness]);
                    translate([MaxDiameter /2, 0, 0])
                        cylinder(PlateThickness, r= OuterRadiusMounts);
                        }
                    translate([MaxDiameter /2, 0, 0])
                        cylinder(PlateThickness, r= InnerRadiusMounts);
                    }
                }
            }
        }
    }