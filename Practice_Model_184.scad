$fn = 100;
mm = 1;
in = 25.4 * mm;
u = 1;
degree = 1;
diameter = .5;
p1=$preview?1+1/$fn:1;
use <Library_2021.scad>

// Note: The variables for annulus(outerRadius, InnerRadius, cylinderHeight)


Part_184();

module Part_184(){
    baseRadius = 20;
    baseHeight = 200;
    
    innerNibCutRad = 10;
    
    difference(){
        cylinder(baseHeight, r= baseRadius);//base pole
            translate([0, 0, baseHeight - 23])annulus(baseRadius, innerNibCutRad, 23);//top nib 
            cylinder(20, d= 20);//bottum pole base cut
            translate([0,0,65])annulus(baseRadius, 15, 5);//square valley
            translate([0,0,baseHeight - (55+17.5+7)])torus(2.5, 0, baseRadius, 360);//rounded valley
            translate([0,0,baseHeight - 9])torus(2.5, 0, innerNibCutRad, 360);//Top rounded valley
    }
    
    translate([0, 0, 25])annulus(70 * diameter, baseRadius, 10);//bottum ridge 
    translate([0,0,90])annulus(30, baseRadius, 8);//middle ridge
    translate([0,0,baseHeight - 55])annulus(70 * diameter, baseRadius, 7);//Top ridge

    }