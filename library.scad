//READ ME
/* List of things to add 
1. annulus flat tube
*/


// bug finder
//assert(TranslatX!=undef, "X translation is required");

//Module list
//orbital_cylinders(ObitalDistance ,NumberOfCylinders , cylinderRadius, cylinderHeight);
//anulus(outerRadius, innerRadius, cylinderHeight);
    //anulus_TanCut(outerRadius, innerRadius, cylinderHeight, tanCutWidth);
//anulus_cube(outerX, outerY, innerX, innerY, HeightZ);
//cube_cut(DepthX, WidthY, HeightZ, TranslateX, TranslateY, TranslateZ);
//cylinder_cut(cylHeight, cylRadius, TranslateX, TranslateY, TranslateZ, rotateX, rotateY, rotateZ);
//rounded_corner(circleRadius,Thickness);
//triangle(Height, length, Depth);



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
module anulus(outerRadius, innerRadius, cylinderHeight, BetweenCenters = 0){
    difference(){
        hull(){
            cylinder(cylinderHeight, r = outerRadius);
        
            translate([BetweenCenters, 0, 0])
                cylinder(cylinderHeight, r = outerRadius);
        }
       hull(){    
        cylinder(cylinderHeight, r = innerRadius);
        
        translate([BetweenCenters, 0, 0])
            cylinder(cylinderHeight, r = innerRadius);   
       }
        
        }
    }

//-------------------------------------------------------------------
module anulus_TanCut(outerRadius, innerRadius, cylinderHeight, tanCutWidth){
   TanCutDepth = outerRadius - sqrt((outerRadius * outerRadius) - (tanCutWidth * tanCutWidth));
   
    difference(){
        cylinder(cylinderHeight, r = outerRadius);
        
        cylinder(cylinderHeight, r = innerRadius);
        
        translate([outerRadius - TanCutDepth , -outerRadius, 0])
            cube([outerRadius, outerRadius * 2, cylinderHeight]);   
        
        }
    }
//---------------------------------------------------------------
module anulus_body(outerRadius, innerRadius, cylinderHeight, height){
   TanCutDepth = 0 + outerRadius - sqrt((outerRadius * outerRadius) - (tanCutWidth * tanCutWidth));
   anulus();
    difference(){
        translate([0 , -outerRadius, 0])
            cube([height, outerRadius * 2, cylinderHeight]);

        cylinder(cylinderHeight, r = outerRadius);
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
//------------------------------------------------------------------------------------------------------------------------
module triangle(Length, Height, Depth){
    linear_extrude(Depth){
        polygon( points = [[0, 0],[Height, 0],[0, Length],[0, 0]]);
    }
        }
    
    
    
    
    
    
    
    
    
    
    
