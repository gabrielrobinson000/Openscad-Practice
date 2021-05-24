$fn = 100;
mm = 1;
degree = 1;
diameter = .5;
use <Library_2021.scad>

part_140();
mirror([1, 0, 0])
rotate([180, 0, 0])
    part_140();

module part_140(){
orbitalDistance = 125 * mm;
    translate([0, -orbitalDistance, 0])
        flanges();
    translate([0, -orbitalDistance, 0])
        tubeBody();
    module tubeBody(){
        outerRadius = 25 * mm;
        innerRadius = (outerRadius - 2.50) * mm;
            torus(outerRadius, innerRadius, orbitalDistance, 90);
    }
    module flanges(){
        OrbitalRadius = 65 * mm;
        orbitCylinderRadius = 15 * mm;
        orbitCylinderRadiusCut = 15 * diameter * mm;
        centerCylRadius = 35 * mm;
        innerRadiusCut = 45 * diameter *  mm;
        NumberOfCylinders = 2;
        Height = 10 * mm;
            translate([orbitalDistance,0,0])
            rotate([90,90,0])
                flange(OrbitalRadius, orbitCylinderRadius, orbitCylinderRadiusCut, centerCylRadius, innerRadiusCut, NumberOfCylinders, Height);

    }
}