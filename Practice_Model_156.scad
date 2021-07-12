$fn = 100;
mm = 1;
in = 25.4 * mm;
u = 1;
degree = 1;
diameter = .5;
p1=$preview?1+1/$fn:1;
use <Library_2021.scad>

Part_156();

module Part_156(){
    
    barWidth = 50;
    barLength = 70;
    barThickness = 10;
        tangeLength = 60;    
    
    rotate([-30, 0, 0])tange();
    baseMount();
    translate([0, barLength - 4.9999955, 0.1415 * 9.4682])mirror([0, 1, 0])rotate([30, 0, 0])tange();
    
    module baseMount(){
        difference(){
            union(){
                cube([barWidth, barLength, barThickness]); 
                translate([0, 10, 0])cube([ 50, 50, barThickness * 2]);
                }
                translate([15, barLength / 2, 0])ceinture(OuterRadius= 5, InnerRadius= 0, Height= barThickness * 2, BetweenCenters= 20);
            }
        }
    
    module tange(){
        tangeWidth = 50;

        translate([0, -tangeLength, 0])
            difference(){
                cube([tangeWidth, tangeLength, barThickness]); 
                #translate([tangeWidth / 2, 20, 0])rotate([0, 0, 90])
                    ceinture(OuterRadius= 6, InnerRadius= 0, Height= barThickness * 2, BetweenCenters= 20);
            }
        }
    
    }
    
    
    
    
    
    
    
    
    
    
    
    