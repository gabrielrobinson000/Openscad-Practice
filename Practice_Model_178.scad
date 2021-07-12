$fn = 100;
mm = 1;
in = 25.4 * mm;
u = 1;
degree = 1;
diameter = .5;
p1=$preview?1+1/$fn:1;
use <Library_2021.scad>


Part_178();

module Part_178(){
    baseVertX = 80;
    baseVertY = 30;
    baseVertZ = 100;
    
    baseHoriX = 80;
    baseHoriY = 130;
    baseHoriZ = 25;
    
    cubeCutHeight = 50;
    
    difference(){
        cube([baseVertX, baseVertY, baseVertZ]);//Vert
            translate([baseVertX / 4,baseVertY - 5, baseVertZ - cubeCutHeight])cube([40, 5, cubeCutHeight]);
            translate([baseVertX / 4 + 5,baseVertY - 10, baseVertZ - cubeCutHeight])cube([30, 10, cubeCutHeight]);
        }
    
    difference(){
        cube([baseHoriX, baseHoriY, baseHoriZ]);//Hori
        hull(){
            translate([baseVertX / 2, baseHoriY, 0])cylinder(5,d= 50);
            translate([baseVertX / 2, baseHoriY - 40, 0])cylinder(5,d= 50);
            }
        hull(){
            translate([baseVertX / 2, baseHoriY, 0])cylinder(baseHoriZ,d= 20);
            translate([baseVertX / 2, baseHoriY - 40, 0])cylinder(baseHoriZ,d= 20);
            }
        hull(){
            translate([baseVertX / 2, baseHoriY, 10])cylinder(15,d2= 50,d1= 30);
            translate([baseVertX / 2, baseHoriY - 40, 10])cylinder(15,d2= 50,d1= 30);
            }
        }
    }