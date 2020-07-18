$fn = 100;
mm = 1;
degree = 1;
diameter = .5;
use <library.scad>

render(){
    Wrench_body();
    base_Wrench();
    rotate(180)
        base_Wrench();
    Top_half_Wrench_body();
    Bottum_half_Wrench_body();
}

baseThickness = 50 * mm;
outerRadius = 50 * mm;
TranslateX = 200 / 2 * mm;
TranslateX4 = 200 / 4 * mm;
innerRadius = 25 * mm ;
bodyThickness = 30;

module base_Wrench(){//Rench head
    translate([TranslateX, 0, 0])
            difference(){ 
                anulus(outerRadius, innerRadius,baseThickness);     
                hull(){
                    cylinder(baseThickness, r = innerRadius);
                    
                    translate([outerRadius, 0, 0])
                    cylinder(baseThickness, r = innerRadius);
                }
             
          }
}

module Wrench_body(){
    wrenchBodyLength = 200 * mm;
            
        difference(){
            translate([-wrenchBodyLength/ 2, -outerRadius, 0])
                cube([ wrenchBodyLength, outerRadius * 2, baseThickness]);
                
            translate([TranslateX, 0, 0])
                cylinder(baseThickness, r = outerRadius);
             
            rotate(180)
              translate([TranslateX, 0, 0])
                cylinder(baseThickness, r = outerRadius);
        }
}

module Top_half_Wrench_body(){
    cutCubeXYZ = 100 * mm;
    difference(){
        union(){
            rotate([0,-90,-90])
                translate([0, 0, -bodyThickness / 2])
                    resize([0,0,bodyThickness])
                        base_Wrench();
            
            rotate([0,-90,-90])
                translate([0, 0, -bodyThickness / 2])
                    resize([0,0,bodyThickness])    
                        Wrench_body();
     }
        translate([ -cutCubeXYZ / 2, -cutCubeXYZ / 2, -cutCubeXYZ])
            cube(cutCubeXYZ);
    }
}

module Bottum_half_Wrench_body(){
rotate([-90, 0, 90])
    translate([0, outerRadius, -bodyThickness / 2])
        anulus(outerRadius, innerRadius, bodyThickness);

rotate([180, 0, 90])
translate([ 0, 0, -TranslateX4])
Top_half_Wrench_body();
    }









