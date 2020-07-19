//READ ME


// bug finder
//assert(TranslatX!=undef, "X translation is required");

//Module list
//orbital_cylinders(ObitalDistance ,NumberOfCylinders , cylinderRadius, cylinderHeight);
//anulus(outerRadius, innerRadius, cylinderHeight);
//anulus_cube(outerX, outerY, innerX, innerY, HeightZ);
//cube_cut(DepthX, WidthY, HeightZ, TranslateX, TranslateY, TranslateZ);
//cylinder_cut(cylHeight, cylRadius, TranslateX, TranslateY, TranslateZ, rotateX, rotateY, rotateZ);
//rounded_corner(circleRadius,Thickness);




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
    assert(TranslateY!=undef, "X translation is required"); 
}
//------------------------------------------------------------------------------------------------------------------------
module rounded_corner(circleRadius,Thickness){// Rounds a corner on a cube.
    difference(){
        translate([ -circleRadius, -circleRadius, 0])
            cube([circleRadius * 2, circleRadius * 2, Thickness]); 

        translate([ -circleRadius, -circleRadius * 2, 0])
            cube([circleRadius * 2, circleRadius * 2, Thickness]);

        translate([ -circleRadius * 2, 0, 0])
            cube([circleRadius * 2, circleRadius * 2, Thickness]);

            cylinder(Thickness,r = circleRadius, true);
    }  
    }
    
    
    
    
    
    
    
    
    
    
    
    
    