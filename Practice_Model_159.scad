$fn = 100;
mm = 1;
in = 25.4 * mm;
u = 1;
degree = 1;
diameter = .5;
p1=$preview?1+1/$fn:1;
use <Library_2021.scad>

Part_159();

module Part_159(){
    majorPivot();
    MinorPivot();
    
    Connection();
    mirror([0, 0, 1])Connection();
    
    Ibeam();
    
        Xoffset = 120;
        MajorRadius = 50 * diameter;
        MinorRadius = 30 * diameter;
        Height = 95;
    
    module majorPivot(){
        innerRadius = 20 * diameter;
        cutHeight = 55;
        Center = true;// only true or false belong here. 
            difference(){
                annulus(MajorRadius, innerRadius, Height, Center);// on (0, 0) annulus
                cylinder(cutHeight, r= MajorRadius + 1, center = Center);
            }
    }
    
    module MinorPivot(){
        innerRadius = 10 * diameter;
        cutHeight = 55;
        Center = true;// only true or false belong here.
        translate([Xoffset, 0, 0])
            difference(){
                annulus(MinorRadius, innerRadius, Height, Center);// on (0, 0) annulus
                cylinder(cutHeight, r= MinorRadius + 1, center = Center);
            }
    }
    
    module Connection(){
        largeConnect = 40 * diameter;
        smallConnect = 20 * diameter;
        ConnectThick = 10;
        shiftUp = 32.5;
        translate([0, 0, shiftUp])
        difference(){
        hull(){
            cylinder(ConnectThick, r= largeConnect,true);// MajorRivot
            translate([Xoffset, 0, 0])
                cylinder(ConnectThick, r= smallConnect, true);// MinorPivot
            }
            
            cylinder(ConnectThick * 2, r= MajorRadius, true);
            translate([Xoffset, 0, 0])
                cylinder(ConnectThick * 2, r= MinorRadius, true);
        
        }
    
    }
    
    module Ibeam(){
        cutCubeX = 45;
        cutCubeY = MajorRadius * 2;
        cutCubeZ = Height;
        IBrigeDepth = 30;
        
        IbeamCutOffset = 2;
        IbeamCutsDepth = 20;
        XwallThickness = 5;
        
        difference(){
            hull(){
                Connection();
                mirror([0, 0, 1])Connection();
            }
            translate([0, -cutCubeY / 2, -cutCubeZ / 2])cube([cutCubeX, cutCubeY, cutCubeZ]);
            translate([cutCubeX + IBrigeDepth, -cutCubeY / 2, -cutCubeZ / 2])cube([cutCubeX, cutCubeY, cutCubeZ]);
            #translate([cutCubeX + XwallThickness, (-cutCubeY / 2) - IbeamCutOffset , -cutCubeZ / 2])cube([IbeamCutsDepth, cutCubeY / 2, cutCubeZ]);
            #mirror([0, 1, 0])translate([cutCubeX + XwallThickness, (-cutCubeY / 2) - IbeamCutOffset , -cutCubeZ / 2])cube([IbeamCutsDepth, cutCubeY / 2, cutCubeZ]);
        }
    }
}