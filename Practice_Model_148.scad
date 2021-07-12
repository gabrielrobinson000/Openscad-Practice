$fn = 100;
mm = 1;
in = 25.4 * mm;
u = 1;
degree = 1;
diameter = .5;
p1=$preview?1+1/$fn:1;
use <Library_2021.scad>

Part_148();


module Part_148(){
    
    CornerChampfer();
    
    PlateDepth = 50;
    //Horizontial Pipe
        AnnulusHeight = 45;
        InnerDiameter = 30 * diameter;
        OuterDiameter = 35 * diameter;
    // The Arch values
        OuterArchRad = 22.50;
        InnerArchRad = 17.50;
        ArchHoleDiameter = 15;
    // Plate Values
        PlateY = 50;
        PlateX = 25;
        PlateZ = 4;
        HoleXOffset = 10;
        CylPlateCutDia = 10;
    //Champfer Offsets
        LegLength = 10;
        ChampferXoffset = (InnerArchRad + PlateX) - LegLength;
        ChampferYoffset =  (PlateDepth / 2) - LegLength;
    difference(){//Horizontial Pipe
        annulus(OuterDiameter, InnerDiameter, AnnulusHeight);
        rotate([90, 0, 0])cylinder(PlateDepth, r= InnerArchRad, center= true);
        }
    difference(){//Vertical Pipe
        rotate([90, 0, 0])translate([0, 0,-PlateDepth / 2])annulus(OuterArchRad, InnerArchRad, PlateDepth);
        cylinder(AnnulusHeight, d= ArchHoleDiameter);
        translate([-OuterArchRad, -PlateDepth / 2, -OuterArchRad])cube([OuterArchRad * 2, PlateDepth, OuterArchRad]);
        }
    module MountPlates(){//Mounting surfaces
        PositiveX();
        NegitiveX();
        module PositiveX(){
            difference(){
                translate([InnerArchRad, - PlateY / 2, 0])cube([PlateX, PlateY, PlateZ]);
                translate([(InnerArchRad + PlateX) - HoleXOffset, 0, 0])cylinder(PlateZ, d= CylPlateCutDia);
                }
            }
        module NegitiveX(){
            difference(){
                translate([-(InnerArchRad + PlateX), - PlateY / 2, 0])cube([PlateX, PlateY, PlateZ]);
                translate([-(InnerArchRad + PlateX) + HoleXOffset, 0, 0])cylinder(PlateZ, d= CylPlateCutDia);
                }
            }
        }
    module CornerChampfer(){
        difference(){
            MountPlates();

            translate([ChampferXoffset, ChampferYoffset, 0])
                linear_extrude(PlateZ)
                    polygon([[LegLength, LegLength],[0, LegLength],[LegLength, 0]]);

            mirror([0, 1, 0])
                translate([ChampferXoffset, ChampferYoffset, 0])
                    linear_extrude(PlateZ)
                        polygon([[LegLength, LegLength],[0, LegLength],[LegLength, 0]]);

            mirror([1, 0, 0])
                translate([ChampferXoffset, ChampferYoffset, 0])
                    linear_extrude(PlateZ)
                        polygon([[LegLength, LegLength],[0, LegLength],[LegLength, 0]]);

            mirror([0,1, 0])mirror([1,0,0])
                translate([ChampferXoffset, ChampferYoffset, 0])
                    linear_extrude(PlateZ)
                        polygon([[LegLength, LegLength],[0, LegLength],[LegLength, 0]]);

            }
        }
    }