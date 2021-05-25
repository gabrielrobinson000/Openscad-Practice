$fn = 100;//This number should normally be around or at 100.


//===========================================================================================================================
//===========================================================================================================================
module sqaure_torus(outerXlength, outerYlength, innerXlength, innerYlength, obritalDis, angleHere){//Sqaure torus
rotate_extrude(angle = angleHere,convexity = 10){
translate([obritalDis + outerXlength / 2, outerYlength / 2, 0])
    difference(){
        square([outerXlength, outerYlength], center = true);
        square([innerXlength, innerYlength], center = true);
        
        }
    }
}
//===========================================================================================================================
//===========================================================================================================================
module torus(outerRadius, innerRadius, orbitalDistance, angleHere){// Donut shape
    rotate_extrude(angle= angleHere, convexity= 10){
        translate([orbitalDistance, 0, 0])
            difference(){
                circle(outerRadius);
                circle(innerRadius);
                }
        }
    assert(angleHere <= 360, "angle is greater than 360!");
    assert(outerRadius > innerRadius, "Inner circle is greater than outer circle!");
    assert(orbitalDistance > 0, "orbital radius is less than zero!");
    }
//===========================================================================================================================
//===========================================================================================================================
module orbital_cylinders(OrbitalRadius, NumberOfCylinders, cylinderRadius, Height, Xtilt, Ytilt){// cuts circles in a circle
    for (Hole = [0:NumberOfCylinders]){
        rotate([0, 0, 360/NumberOfCylinders])
        translate([OrbitalRadius, 0, 0])
        rotate([Xtilt, Ytilt,0])
            cylinder(Height, r= cylinderRadius);
        }
    }
//===========================================================================================================================
//===========================================================================================================================
module annulus(OuterRadius, InnerRadius, Height){//Pipe shape
    differnce(){
        //Prime object
        cylinder(Height, r= OuterRadius);
        //Cutting object(s)
        cylinder(Height, r= InnerRadius);
        }
    }
//==========================================================================================================================
//==========================================================================================================================
module ceinture(OuterRadius, InnerRadius, Height, BetweenCenters){// Belt shape
    difference(){
        hull(){//Prime object
            cylinder(Height, r= outerRadius);
            translate([BetweenCenters, 0, 0])
                cylinder(Height, r= outerRadius);
            }
        hull(){//Cutting object
            cylinder(Height, r= InnerRadius);
            translate([BetweenCenters, 0, 0])
                cylinder(Height, r= InnerRadius);
            }
        }
    }
//==========================================================================================================================
//==========================================================================================================================
module triangle(type, leg_a, leg_b,hypotenuse){// draws right, scalene, isosceles and equilateral triangles
    if(type == "right"){
        polygon( points = [[0, 0],[leg_a, 0],[0, leg_b]]);
            }
        else if(type == "scalene"){
            hypotenuse = sqrt(pow(leg_a, 2) + pow(leg_b, 2));
                polygon(points = [[0,-(leg_a/2)],[leg_b,0],[0,hypotenuse]]);
            }
        else if(type == "isosceles"){
                polygon(points = [[0,-(leg_a/2)],[leg_b,0],[0,(leg_a/2)]]);
            }
        else if(type == "equilateral"){
                polygon(points = [[0,-(leg_a/2)],[leg_a,0],[0,leg_a]]);
            }
    }
//==========================================================================================================================
//==========================================================================================================================
module _name_(){}
//==========================================================================================================================
//==========================================================================================================================
module _name_(){}
//==========================================================================================================================
//==========================================================================================================================
module _name_(){}
//==========================================================================================================================
//==========================================================================================================================
