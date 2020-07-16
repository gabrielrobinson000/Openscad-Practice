//READ ME

//Module list
//orbital_cylinders(ObitalDistance ,NumberOfCylinders , cylinderRadius, cylinderHeight);
//annulus(outerRadius, innerRadius, cylinderHeight);




//------------------------------------------------------------------------------------------------------------------------
module orbital_cylinders(ObitalDistance ,NumberOfCylinders , cylinderRadius, cylinderHeight){
    // Will generate a set of orbiting cylinders base on the values you give it.
    for (Holes = [0:360/NumberOfCylinders:360] ){
        rotate([0, 0, Holes])
        translate([ObitalDistance, 0, 0])
        cylinder(cylinderHeight, r = cylinderRadius);
        }// hehe cuts circles in a circle
        
        // Starting with the DISTANCE from the X ORIGIN to the X EDGE of the circle .ie (Radius)
}       // The obiting cylinders will be evenly spaced starting on the X line.
        // To finish the orbiting cylinders will also be defined in RADIUS,
        // just acted like they're normal cylinders they don't like being called clones.
//------------------------------------------------------------------------------------------------------------------------
module anulus(outerRadius, innerRadius, cylinderHeight){
    difference(){
        cylinder(cylinderHeight, r = outerRadius);
        cylinder(cylinderHeight, r = innerRadius);
        
        }
    }








