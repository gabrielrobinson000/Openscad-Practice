$fn = 100;
mm = 1;
in = 25.4 * mm;
u = 1;
degree = 1;
diameter = .5;
p1=$preview?1+1/$fn:1;
use <Library_2021.scad>

Part_146();


module Part_146(){
    difference(){
        union(){
            BasePlate();
            Pole();
            Head();
            }
            ThroughCuts();
            #HeadCuts();
    }
  
        //BasePlate Variables
            BasePlateZ = 10 * u;
            BasePlateXY = 55 * u;
        //Pole Variables
            PoleLength = 85 * u;
        //Head Variable 
            HeadHeightZ = 50 * u;
    
    //Center Hole Cut
        ThroHoleAllDis = BasePlateZ + PoleLength + HeadHeightZ;

    
    module BasePlate(){
        translate([0, 0, (BasePlateZ / 2)])
            cube([BasePlateXY, BasePlateXY, BasePlateZ], center= true);
        }
        
        module ThroughCuts(){
            ThroHoleDiameter = 8.5 * diameter * u;
            CenterHoleCut = 15 * diameter * u;
            HoleDist = 39 * u;
            // Puts hole in the right distance
            a = HoleDist;
            b = HoleDist;
            c = pow(HoleDist, 2);
            h = sqrt((pow(a, 2) + pow(b, 2)));
            h_2 = pow((h / 2), 2);
            // ==============================
            HoleRadius = sqrt(c - h_2) * u;
            #rotate([0,0, 45])
                orbital_cylinders(OrbitalRadius= HoleRadius, NumberOfCylinders= 4, cylinderRadius= ThroHoleDiameter, Height= BasePlateZ, Xtilt= 0, Ytilt= 0);
            cylinder(ThroHoleAllDis, r= CenterHoleCut);
            }
    module Pole(){
        CutDiameter = 20 * diameter * u;
        translate([0, 0, BasePlateZ])
            cylinder(PoleLength, r= CutDiameter);
        }
    module Head(){
        transOffSet = HeadHeightZ / 2;
        HeadCubeXY = 30 * u;
        HeadPlace = (39 - HeadCubeXY);
        HeadCubeZ = HeadHeightZ;
        CylRadius = 15 * u;
        
        translate([HeadPlace, 0, 0]){
            translate([0, 0, transOffSet + (BasePlateZ + PoleLength)])
                cube([HeadCubeXY, HeadCubeXY, HeadCubeZ], center= true);
            
            translate([-HeadCubeXY / 2, 0, (BasePlateZ + PoleLength)])
                cylinder(HeadCubeZ, r= CylRadius);
            }
        }

    module HeadCuts(){
        OuterCutDiameter = 10 * diameter * u;
        MildCutDiameter = 7  * diameter * u;
        HoleOffset = 15 * u;
        OverAllHead = 40 * u;
        
        
        translate([0, 0, BasePlateZ + PoleLength + (HeadHeightZ / 2)])
        rotate([0, 90, 0]){
        
                cylinder((BasePlateXY / 2), r= MildCutDiameter);// Middle Hole
            translate([HoleOffset, 0, 0])
                cylinder((BasePlateXY / 2), r= OuterCutDiameter);// Top Hole
            translate([-HoleOffset, 0, 0])
                cylinder((BasePlateXY / 2), r= OuterCutDiameter);// Bottum Hole
        }
        
        }
    }