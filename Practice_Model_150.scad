$fn = 100;
mm = 1;
in = 25.4 * mm;
u = 1;
degree = 1;
diameter = .5;
p1=$preview?1+1/$fn:1;
use <Library_2021.scad>

Part_150();


module Part_150(){
    Fins();
    Stem();
    Base();
    
    //Annulus Pipe Values
    OuterDAnnulus = 50 * diameter;
    InnerDAnnulus = 40 * diameter;
    AnnulusHeight = 160;
        
 
    module Fins(){
    //Shutter Values
    ShutterLength = 125;
    archLength = 10;
    NumberOfBlades = 6;
    ShutterHeight = 90;
    ShutterCutHeight = 70;
        zOffset = AnnulusHeight - ShutterHeight;

        difference(){
            //The fins
            translate([0, 0, zOffset])
                CircularShutters(ShutterLength, archLength, NumberOfBlades, ShutterHeight, $fn = 360);
            //Inside the tube fin cuts
            cylinder(AnnulusHeight, r= InnerDAnnulus);
            // The angle Fin cuts
            #translate([0,0, ShutterHeight])
                rotate_extrude(angle = 360, convexity = 2)
                    polygon(points = [ [ShutterLength + 1, ShutterCutHeight], [ShutterLength + 1, 0], [OuterDAnnulus, ShutterCutHeight ] ]);
        }
    }
    
    module Stem(){annulus(OuterDAnnulus,InnerDAnnulus, AnnulusHeight);}

    module Base(){
    // Base mount
        BaseDiameter = 150;
        BaseHeight = 10;
    //Orbital_cylinder Values
        OrbitalRadius = 110 * diameter;
        NumberOfCylinders = 5;
        cylinderRadius = 5;
        Height = BaseHeight;
        difference(){
            cylinder(BaseHeight, d= BaseDiameter);
            orbital_cylinders(OrbitalRadius, NumberOfCylinders, cylinderRadius, Height, Xtilt= 0, Ytilt= 0);
            cylinder(BaseHeight, r= InnerDAnnulus);
            }
        }
    }
    
    
    
    
    
    
    
    
    