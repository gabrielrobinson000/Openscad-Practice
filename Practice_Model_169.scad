$fn = 100;
mm = 1;
in = 25.4 * mm;
u = 1;
degree = 1;
diameter = .5;
p1=$preview?1+1/$fn:1;
use <Library_2021.scad>


Part_169();

module Part_169(){
    armLength = 100;
    armThickness = 10;
    partThickness = 40;
    mainMajorRad = 35;
    secMinorRad = 20;
    mountHeight = 60;
    mountThickness = 10;
    RidgeHeight = 10;
    ridgeLength = 60;
    
    annulus(mainMajorRad, 25, partThickness);//Main node
    mount();// mount Left
    mirror()mount();// mount Right
    Reforce();//reforcement ramp
    arm();// arm
    translate([armLength, 0, 0])annulus(secMinorRad, 10, partThickness);//secondary node
    translate([0, 0, 15])ridge();
    
    module Reforce(){}
    module arm(){// arm
                difference(){
                    translate([0, - armThickness / 2, 0])cube([armLength, armThickness,partThickness]);
                    cylinder(partThickness, r= mainMajorRad);
                    translate([armLength, 0, 0])cylinder(partThickness, r= secMinorRad);
                }
            }
    module mount(){
        mountOffset = 10;
        offTopOffset = 15;
        cutCylRad = 7.5;
        difference(){
            translate([mountOffset, 0, 0])cube([mountThickness, mountHeight, partThickness]);//mount left
                cylinder(partThickness, r= mainMajorRad);
                translate([0, mountHeight - offTopOffset, partThickness / 2])rotate([0, 90, 0])cylinder(partThickness, r= cutCylRad, center= true);
            }
    }
    module ridge(){
        difference(){
            union(){
                hull(){
                    cylinder(RidgeHeight, r= mainMajorRad);
                    translate([ridgeLength, 0, 0])cylinder(RidgeHeight, d= mountThickness);
                }
            }
            cylinder(RidgeHeight, r= mainMajorRad);
            translate([ridgeLength, 0, 0])cylinder(RidgeHeight, d= mountThickness);

        }
    }

}