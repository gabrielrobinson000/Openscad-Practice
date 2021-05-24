$fn = 100;
mm = 1;
degree = 1;
diameter = .5;
use <Library_2021.scad>

Part_139();

module Part_139(){
    difference(){
        Wall();
        Wall2();
        RoundedCorners();
    }
    //Base cylinder variables 
    CylHeight = 12 * mm;
    CylRadius = 62.5 *mm;
    //orbital_cylinder variables CUTS
    OrbitalRadius = 90 * diameter * mm;
    NumberOfCylinders = 3;
    cylinderRadius = 16 * diameter * mm;
    Height = CylHeight;
    Xtilt = 0;
    Ytilt = 0;
    CenterCutDiameter = 25 * diameter * mm;
    rotate([0,0, 0])
        difference(){
            cylinder(CylHeight, r= CylRadius);
            orbital_cylinders(OrbitalRadius, NumberOfCylinders, cylinderRadius, Height, Xtilt, Ytilt);
            cylinder(CylHeight, r= CenterCutDiameter);
            }
    //Wall variables
    WallThickness = 25 * mm;
    WallThicknessCut = 15 * mm;
    CylWallRadius = 20 * mm;
    WallHeight = 50 * mm;
    //translate([0, 0, 50])
        //cylinder(WallThickness, r= CylWallRadius);
    
    module Wall(){
        angle = -120;
        NumberOfWalls = 3;
        WallOffset = 15 * mm;
        
        rotate([0,0, -30])
        for (Hole = [0:NumberOfWalls]){
            rotate([0, 0, 360/NumberOfWalls * Hole])
                union(){
                    cube([WallThickness, CylRadius, WallHeight]);
                    rotate([0, 0, angle])
                        translate([-WallThickness, 0, 0])
                            cube([WallThickness, CylRadius, WallHeight]);
                    }
            }
        }
        
    module Wall2(){
        angle = -120;
        NumberOfWalls = 3;
        WallOffset = 15 * mm;
        
        rotate([0,0, -30])
        for (Hole = [0:NumberOfWalls]){
            rotate([0, 0, 360/NumberOfWalls * Hole])
                union(){
                    cube([WallThicknessCut, CylRadius, WallHeight]);
                    rotate([0, 0, angle])
                        translate([-WallThicknessCut, 0, 0])
                            cube([WallThicknessCut, CylRadius, WallHeight]);
                    }
            }
        }

    module RoundedCorners(){
        annulus(OuterRadius = CylRadius * 2, InnerRadius = CylRadius, Height = WallHeight * 1.25);
        }
}