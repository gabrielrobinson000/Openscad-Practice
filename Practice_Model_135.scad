$fn = 100;
mm = 1;
degree = 1;
diameter = .5;
use <Library_2021.scad>

part_135();

module part_135(){
orbitalDistance = 125 * mm;
    flanges();
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
            translate([0,orbitalDistance,0])
            rotate([-90,90,90])
                flange(OrbitalRadius, orbitCylinderRadius, orbitCylinderRadiusCut, centerCylRadius, innerRadiusCut, NumberOfCylinders, Height);
    }
}