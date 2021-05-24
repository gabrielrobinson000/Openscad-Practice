$fn = 200;
mm = 1;
degree = 1;
diameter = .5;
use <Library_2021.scad>

model_132();

module model_132(){
    cylinderBase();
        module cylinderBase(){
            CylHeight = 100 * mm;
            CylDiameter = 75 * mm;
            difference(){
                union(){
            translate([0, 0, 0])
            rotate([90, 0, 0])
                cylinder(CylHeight, d= CylDiameter, center= true);
                    Stem();
                }
                CylDiameterCut = 45 * mm;
                translate([0, 0, 0])
                rotate([90, 0, 0])
                    cylinder(CylHeight, d= CylDiameterCut, center= true);
                }
            module Stem(){
                difference(){
                    hull(){
                        forkBase();
                        topOfForkCyl();
                    }
                }
            length = 40 * mm;
            width = 40 * mm;
            Height = 50 * mm;
            translate([0,0,Height / 2])
                cube([length, width, Height], center = true);
                module forkBase(){
                    lengthF = 47 * mm;
                    widthF = 80 * mm;
                    HeightF = $fs / 10; // This number should stay tiny in relation to length and width
                    translate([0,0,Height + HeightF])
                        cube([lengthF, widthF, HeightF], center = true);
                    }
                    module topOfForkCyl(){
                            CylRadius = 17.50 * mm;
                            CylHeight = 80 * mm;
                            Zoffset = 100;
                            translate([0, 0, Zoffset])
                            rotate([90, 0, 0])
                                cylinder(CylHeight,r= CylRadius ,center= true);

                        }

                }

            }

        }
        