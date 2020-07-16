$fn = 100;
mm = 1;
degrees = 1;
diameter = .5;
use <library.scad> 

//Base Plate Values
baseThickness = 10 * mm;
baseOuterDiameter = 100 * mm * diameter;
baseInnerDiameter = 40 * mm * diameter;

//shaft vaules
mainShaftHeight   = 65 * mm;
shaftOuterDiameter = 50 * mm * diameter;

//Top sleeve values
partOverAllHeight = 90 * mm;
TopSleeveHeight   = 35 * mm;
outerSleeveDiameter = 60 * mm * diameter;
innerSleeveDiameter = 50 * mm * diameter;

//obrital values
orbitalDistance   = 80 * mm * diameter;
NumberOfCylinders = 6;
orbitCylinderSize = 11.80 * mm * diameter;
orbitCylHeight    = baseThickness;


// Main object 
difference(){
    anulus(baseOuterDiameter,baseInnerDiameter,baseThickness);
    orbital_cylinders(orbitalDistance,NumberOfCylinders,orbitCylinderSize,orbitCylHeight);
}
anulus(shaftOuterDiameter, baseInnerDiameter, mainShaftHeight);

translate([ 0, 0, partOverAllHeight - TopSleeveHeight])
anulus( outerSleeveDiameter, innerSleeveDiameter, TopSleeveHeight);










