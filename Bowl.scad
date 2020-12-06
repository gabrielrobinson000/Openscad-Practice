// sizes are set in millimeter.
mm = 1;
$fn = 25;
cubeSides = 50;

translate([0, 0, cubeSides])
    Bowl();
    Base();
    
module Base(){
    difference(){
        union(){
            for (i = [0: 360/4: 360]){
            rotate ([0, 0, i])
            translate([cubeSides * .80, 0, 0])
                cylinder(50, cubeSides * .06 * mm);
                }
            }
            translate([0, 0, cubeSides])
                sphere( cubeSides * mm);

        }
    
    }

module Bowl(){
    difference(){
        sphere( cubeSides * mm);
        sphere( (cubeSides * .94)  * mm);
        
    translate([-cubeSides, -cubeSides, 0])
            cube([cubeSides * 2, cubeSides * 2, cubeSides * 2]);
    }

    for (i = [0: 360]){
        rotate ([0, 0, i])
        translate([cubeSides * .94, 0, 0])
            sphere(cubeSides * .06 * mm);
        }
}