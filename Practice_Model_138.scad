$fn = 100;
mm = 1;
degree = 1;
diameter = .5;
use <Library_2021.scad>

Base();

module Base(){


    OuterDiameter = 70 * mm * diameter;
    CylHeight = 90 * mm;
    Z_offset = 30 * mm;
        translate([0, 0, -Z_offset])
            annulus(OuterDiameter,innerRadiusCut,CylHeight);

    OuterX = 28 * mm;// assumed 
    OuterY = 75 * mm;
         Z = 30 * mm;
    InnerX = 18 * mm;
    InnerY = 65 * mm;// assumed
    Xoffset = 0;
    Yoffset = 0;
    Zoffset = 0;
    rotate([0, 90, 90])
    translate([-Height / 2, 0, (Z / 2) + 40])// "(Z/2)+40" value for translate was a guess.
        box(OuterX, OuterY, Z, InnerX, InnerY, Z, Xoffset, Yoffset, Zoffset);

    OrbitalRadius = (175 / 2) * mm;
    orbitCylinderRadius = 20 * mm;
    orbitCylinderRadiusCut = 20 * diameter * mm;
    centerCylRadius = 50 * mm;
    innerRadiusCut = 50 * diameter *  mm;
    NumberOfCylinders = 2;
    Height = 40 * mm;
    difference(){
        flange(OrbitalRadius, orbitCylinderRadius, orbitCylinderRadiusCut, centerCylRadius, innerRadiusCut, NumberOfCylinders, Height);
        rotate([0, 90, 90])
        translate([-Height / 2, 0, (Z / 2) + 40])// "(Z/2)+40" value for translate was a guess.
            cube([InnerX, InnerY, Z], center = true);
    }
}
