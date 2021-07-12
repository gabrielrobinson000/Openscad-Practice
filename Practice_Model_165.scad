$fn = 100;
mm = 1;
in = 25.4 * mm;
u = 1;
degree = 1;
diameter = .5;
p1=$preview?1+1/$fn:1;
use <Library_2021.scad>


Part_165();

module Part_165(){
    
    rotate([0, 0, -45]){
        translate([0, 0, 30])Arm();
        mirror([0, 0, 1])translate([0, 0, 30])Arm();
    }
    annulus(30, 15, 120, true);
    
    Mount();
    
    module Arm(){
        Height = 10;
        difference(){
            union(){
                hull(){
                    cylinder(Height, r= 30);//elbow
                    translate([100, 0, 0])cylinder(Height, r= 17.50);//rist
                    }
                }
            cylinder(Height, r= 15);//elbow
            translate([100, 0, 0])cylinder(Height, r= 12.50);//rist
            }
        }
    module Mount(){
        difference(){
            union(){
                hull(){
                    cylinder(40, r= 25, center= true);
                    translate([-60, 0, 0])cylinder(40, r= 25, center= true);
                    }
                }
           cylinder(40, r= 25, center= true);
           translate([-60, 0, 0])cylinder(40, r= 12.5, center= true);
        }
    }
}
    
    