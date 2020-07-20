$fn = 100;
mm = 1;
degree = 1;
diameter = .5;
use <library.scad>

base_Plate();



module base_Plate(){
Triangle_mounts();


baseDepth = 150;
baseWidth = 100;
baseHeight = 15;

cube([baseDepth, baseWidth, baseHeight]);

    module Triangle_mounts(){
        middle_arm();
    
    TriangleHeight = 20;
    TriangleLength = 42.5;
    TriangleDepth = 15;
    TriangleXtranslation = 67.50;
        
    MiddleThickness = 15;

        translate([TriangleDepth + TriangleXtranslation, TriangleLength, baseHeight])
            rotate([90, 0, -90])
                triangle(TriangleHeight, TriangleLength, TriangleDepth);
        
        translate([ TriangleXtranslation, TriangleLength + MiddleThickness, baseHeight])
            rotate([90, 0, 90])
                triangle(TriangleHeight, TriangleLength, TriangleDepth);

            
            module middle_arm(){
            OuterCircle = 25;
            innerCircle = 20 * diameter;
            circleHeight = 15;
            circleTranslation = 80;
             
               difference(){  
                union(){
                   hull(){   
                   hull(){
                       translate([baseDepth / 2, TriangleLength, 0])
                            cube([ baseDepth / 2, MiddleThickness, baseHeight]);
                       
                       translate([0, TriangleLength, baseHeight])
                            cube([ baseDepth / 2, MiddleThickness, baseHeight]);
                       }
                    
              
                  rotate([-90, -60, 0])
                        translate([ OuterCircle, -circleTranslation -baseHeight, TriangleLength])
                            cylinder(circleHeight, r = OuterCircle);
               
             }
              }
                   rotate([-90, -60, 0])
                        translate([ OuterCircle, -circleTranslation -baseHeight, TriangleLength])
                            cylinder(circleHeight, r = innerCircle);
                 
               
}


}
}
}
