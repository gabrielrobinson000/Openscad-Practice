$fn = 100;
mm = 1;
in = 25.4 * mm;
u = 1;
degree = 1;
diameter = .5;
p1=$preview?1+1/$fn:1;
use <Library_2021.scad>

Part_145();


module Part_145(){
#Strut();
    difference(){
        union(){

            difference(){
                BasePlate();
                    ThroughCuts();

            }
            #Monolith();
        }
        UnderMonolithCut();
    }

    //BasePlate Variables
        BasePlateXY = 110 * u;
        BasePlateZ = 12 * u;
    
    //Monolith Variables
        MonolithRadius = 12 * u;
        MonolithXY = (90 - (MonolithRadius * 2)) * u;
        MonolithZ = 60 * u;
    
    module BasePlate(){
        PlateRadius = 20 * u;
        
        linear_extrude(height= BasePlateZ)
        projection(cut= true)
        minkowski(){
            cube([BasePlateXY, BasePlateXY, BasePlateZ], center= true);
            cylinder(r= PlateRadius, BasePlateZ);
            }
        }
    module Monolith(){
        linear_extrude(height= MonolithZ)
        projection(cut= true)
        minkowski(){
            cube([MonolithXY, MonolithXY, MonolithZ], center= true);
            cylinder(r= MonolithRadius, MonolithZ);
            }
        
        }
    module ThroughCuts(){
        ThroHoleDiameter = 12 * diameter * u;
        // Puts hole in the right distance
        a = BasePlateXY;
        b = BasePlateXY;
        c = pow(BasePlateXY, 2);
        h = sqrt((pow(a, 2) + pow(b, 2)));
        h_2 = pow((h / 2), 2);
        // ==============================
        HoleRadius = sqrt(c - h_2) * u;
        rotate([0,0, 45])
        orbital_cylinders(OrbitalRadius= HoleRadius, NumberOfCylinders= 4, cylinderRadius= ThroHoleDiameter, Height= BasePlateZ, Xtilt= 0, Ytilt= 0);
        }
    module UnderMonolithCut(){
        UnderCubeXY = 70 * u;
        UnderCubeZ = 50 * u;
        linear_extrude(height= UnderCubeZ)
            square(UnderCubeXY, center= true);
        }
    module Strut(){
        overAllD = 150 / 2;
        leg_a = 38;
        leg_b = 30;
        Height = 10 * u;
        for(strutPlacement = [0:90:360]){
            rotate([0, -90, strutPlacement])
            translate([BasePlateZ, overAllD - leg_b, 0])
                linear_extrude(height= Height, center= true)
                    polygon(points = [[0, 0],[leg_a, 0],[0, leg_b]]);
        }
        }
    }