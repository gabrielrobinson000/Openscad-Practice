$fn = 100;
mm = 1;
degree = 1;
diameter = .5;
angleOffset = 90;
use <library.scad>

render(){
    Part_119();
    }


module Part_119(){
    
    plateDepth = 200;
    plateWidth = 100;
    plateHeight = 20;
    startingXOffset = 25;
    YOffset = 20;
    betweenHoleDis = 50;
    
    arms();
    base_Plate();
    
module base_Plate(){
    difference(){
        cube([plateDepth, plateWidth, plateHeight]);
        
        for (cuts = [0:betweenHoleDis:plateDepth]){
            cylDiameter = 15 * diameter;
            
            translate([startingXOffset + cuts,YOffset, 0])
                cylinder(plateHeight, r = cylDiameter);

            translate([startingXOffset + cuts,plateWidth - YOffset, 0])
                cylinder(plateHeight, r = cylDiameter);
            }
        }
    }
    
    
module arms(){
    
    centerCylinderRadius = 17.5;
    centerCylinderThickness = 20;
    outerArmRadius = 15;
    innerDiameter = 15 * diameter;
    ArmHeight = 70;
    ArmAngle = 55 ; 
   
    right_Arm();
    left_Arm();
    
    translate([plateDepth / 2, plateWidth / 2 ,plateHeight])
    rotate([-90, 0, 0])
        cylinder(centerCylinderThickness, r = centerCylinderRadius,center = true);

module right_Arm(){
    difference(){   
       hull(){
               hulling_cube();
               
            rotate([0, -ArmAngle, 00])
            translate([outerArmRadius, plateWidth / 2 , plateHeight + ArmHeight])
            rotate([-90, 0, 0])
                cylinder(centerCylinderThickness, r = outerArmRadius, center = true);
           }

           rotate([0, -ArmAngle, 00])
            translate([outerArmRadius, plateWidth / 2 , plateHeight + ArmHeight])
            rotate([-90, 0, 0])
                cylinder(centerCylinderThickness, r = innerDiameter, center = true);
       }
   }


module left_Arm(){
    difference(){
        hull(){
            translate([plateWidth , 0, 0])
                hulling_cube();
            translate([plateDepth,0,0])
            mirror([180, 0, 0])
            rotate([0, -ArmAngle, 0])
            translate([outerArmRadius, plateWidth / 2 , plateHeight + ArmHeight])
            rotate([-90, 0, 0])
                cylinder(centerCylinderThickness, r = outerArmRadius, center = true);//Ugly learn to make this cleaner
            }

            translate([plateDepth,0,0])
            mirror([180, 0, 0])
            rotate([0, -ArmAngle, 0])
            translate([outerArmRadius, plateWidth / 2 , plateHeight + ArmHeight])
            rotate([-90, 0, 0])
                cylinder(centerCylinderThickness, r = innerDiameter, center = true);
        }
    }
    
    
    module hulling_cube(){
        translate([0, plateWidth / 2 - centerCylinderThickness / 2 ,plateHeight])
            cube([plateDepth / 2, centerCylinderThickness,centerCylinderRadius* .25]);
        }
        
        }
        
    }
    
