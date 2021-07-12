$fn = 100;
mm = 1;
in = 25.4 * mm;
u = 1;
degree = 1;
diameter = .5;
p1=$preview?1+1/$fn:1;
use <Library_2021.scad>


Part_183();

module Part_183(){
    PlateLength = 130;
    PlateThickness = 15;
    
    ShortCylH = 36;
    ShortCylRad = 50;
    
    tallCylH = 51.2;
    tallCylRad = 28;
    
    CutRad = 20;
    
    mountHoleRad = 7;
    BetweenCenters = 102;
    OffOfEdge = 14;
    
    
    difference(){
        union(){
            cube([PlateLength, PlateLength, PlateThickness]);
            translate([PlateLength / 2, PlateLength / 2, 0])cylinder(ShortCylH, r= ShortCylRad);
            translate([PlateLength / 2, PlateLength / 2, 0])cylinder(tallCylH, r= tallCylRad);
            }
        translate([PlateLength / 2, PlateLength / 2, 0])cylinder(tallCylH, r= CutRad);
        
            translate([OffOfEdge, OffOfEdge, 0])cylinder(tallCylH, r= mountHoleRad);// Bottum left
            translate([OffOfEdge + BetweenCenters, OffOfEdge, 0])cylinder(tallCylH, r= mountHoleRad);// Bottum right
            translate([OffOfEdge, OffOfEdge + BetweenCenters, 0])cylinder(tallCylH, r= mountHoleRad);// Top left
            translate([OffOfEdge + BetweenCenters, OffOfEdge + BetweenCenters, 0])cylinder(tallCylH, r= mountHoleRad);// Top right
        }
    

        
    }
    
    
    
    
    
    
    