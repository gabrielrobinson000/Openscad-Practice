//READ ME

//Module list
//orbital_cylinders(ObitalDistance ,NumberOfCylinders , cylinderRadius, cylinderHeight);
//anulus(outerRadius, innerRadius, cylinderHeight);
//anulus_cube(outerX, outerY, innerX, innerY, HeightZ);
//cube_cut(DepthX, WidthY, HeightZ, TranslateX, TranslateY, TranslateZ);
//cylinder_cut(cylHeight, cylRadius, TranslateX, TranslateY, TranslateZ, rotateX, rotateY, rotateZ);
//rounded_cube();




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
//------------------------------------------------------------------------------------------------------------------------
module anulus_cube(outerX, outerY, innerX, innerY, HeightZ){
    difference(){
        cube([ outerX, outerY, HeightZ], true);
        cube([ innerX, innerY, HeightZ],true);
        }
    }
//------------------------------------------------------------------------------------------------------------------------
module cube_cut( DepthX, WidthY, HeightZ, TranslateX, TranslateY, TranslateZ ){
    translate([ TranslateX, TranslateY, TranslateZ])
        cube([ DepthX, WidthY, HeightZ]);
    }
//------------------------------------------------------------------------------------------------------------------------
module cylinder_cut(cylHeight, cylRadius, TranslateX, TranslateY, TranslateZ, rotateX, rotateY, rotateZ){
translate([TranslateX, TranslateY, TranslateZ])
    rotate([rotateX, rotateY, rotateZ])
        cylinder(cylHeight, r = cylRadius);
}
//------------------------------------------------------------------------------------------------------------------------
module rounded_cube(){
    
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    