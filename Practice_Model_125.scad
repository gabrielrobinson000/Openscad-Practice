$fn = 100;
mm = 1;
degree = 1;
diameter = .5;
use <library.scad>

part_125();

module part_125(){
    anulusOuter = 30 * diameter;
    anulusInner = 24 * diameter;
    anulusHeight = 70;
    
    outerXlength = 50;
    outerYlength = 50;
    innerXlength = 44;
    innerYlength = 44;
    obritalDis   = 75;
    angleHere    = 90;
    
    translate([0, 0, obritalDis + outerXlength / 2])
    rotate([0, -90, 0])
        anulus(anulusOuter, anulusInner, anulusHeight);
    end_cubeX();
    end_cubeZ();
    bentCutOut();
        
    module bentCutOut(){
        difference(){
            translate([0, outerXlength / 2, 0])
            rotate([90, 0, 0])
                bent_cube(outerXlength, outerYlength, innerXlength, innerYlength, obritalDis, angleHere);

            translate([0, outerXlength / 2 - (outerYlength - innerYlength), 0])
            rotate([90, 0, 0])
                bent_cube(innerXlength, innerYlength, 0, 0, obritalDis + (outerYlength - innerYlength) / 2, angleHere);
            }
    }

    module end_cubeX(){
        difference(){
            translate([obritalDis, -outerYlength / 2, 0])
                cube([outerXlength, outerYlength,outerXlength - innerXlength]);
            
            translate([obritalDis + anulusInner * 2,0, 0])
                cylinder(outerXlength - innerXlength, r = anulusInner);
    }
    }
    
module end_cubeZ(){
        difference(){
            translate([0, -outerYlength / 2, outerXlength + obritalDis])
            rotate([0, 90, 0])
                cube([outerXlength, outerYlength,outerXlength - innerXlength]);
            
            translate([0, 0, outerXlength / 2 + obritalDis])
            rotate([0, 90, 0])
                cylinder(outerXlength - innerXlength, r = anulusInner);
    }
    }    
    translate([obritalDis + anulusInner * 2,0,-anulusHeight])
        anulus(anulusOuter, anulusInner, anulusHeight);
    }