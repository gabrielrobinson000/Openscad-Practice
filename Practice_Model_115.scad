$fn = 100;
mm = 1;
diameter = .5;
degrees = 1;
use <library.scad>

// For future Gabe the approch i'm taking here is subtractive in nature.
// You may need to make new modules in library for this part.

render(){
starting_Block();
}
 


    
module starting_Block(){
    Major_Cut();
    baseDepth = 100 * mm;
    baseWidth = 140 * mm;
    baseHeight = 60 * mm;
    
    cylCenterCutRadius = 25 * mm;
    
    backThickness = 12 * mm;
    baseThickness = 12 * mm;
    sideCutDepth = baseDepth - backThickness;
    sideCutHeight = baseHeight - baseThickness;
    cubeCutWidth = 40 * mm;
    
    mountingHolesDiameter = 15 * diameter *mm;
    mountingTransDepthBack = 27 * mm;
    mountingTransDepthFront = 50 + mountingTransDepthBack;
    mountingTransWidth = 100 * mm;
    
    boxCutWidth = 25 * mm;
    boxCutHeight = 15* mm;
    cubeCutTransY = 7.5 * mm;
    cubeCutTransZ = 22.5 * mm ;
      
    module Major_Cut(){
        difference(){
            cube([baseDepth, baseWidth, baseHeight]);//Base block
            
            cube_cut(backThickness, boxCutWidth, boxCutHeight, 0, cubeCutTransY, cubeCutTransZ);
            
            cube_cut(backThickness, boxCutWidth, boxCutHeight, 0, baseWidth - (cubeCutTransY + boxCutWidth), cubeCutTransZ);
            
            cylinder_cut(baseDepth, cylCenterCutRadius, 0, baseWidth / 2, baseHeight, 0, 90, 0);// Top Cylinder cut
            
            translate([ mountingTransDepthBack, baseWidth /2 , 0])
                rotate(90)
                    orbital_cylinders(mountingTransWidth / 2 , 2, mountingHolesDiameter, baseThickness);
            
            translate([ mountingTransDepthFront, baseWidth /2 , 0])
                rotate(90)
                    orbital_cylinders(mountingTransWidth / 2 , 2, mountingHolesDiameter, baseThickness);
            
            cube_cut(sideCutDepth, cubeCutWidth, sideCutHeight, backThickness, 0, baseThickness);// Left cube Cut
            
            cube_cut(sideCutDepth, cubeCutWidth, sideCutHeight, backThickness, baseWidth - cubeCutWidth, baseThickness);//Right cube Cut
            
            translate([baseDepth - cylCenterCutRadius, cylCenterCutRadius, 0])
                rounded_corner();
            
            translate([backThickness, cylCenterCutRadius, baseHeight - cylCenterCutRadius])
                rotate([-90,-90,90])
                    rounded_corner();
                    
            translate([baseDepth - cylCenterCutRadius, baseWidth - cylCenterCutRadius, 0])
                rotate([0,0,90])
                    rounded_corner();
            
            translate([0, baseWidth - cylCenterCutRadius, baseHeight - cylCenterCutRadius])
                rotate([-90,-90,-90])
                    rounded_corner();
            
            
            }
        }
module rounded_corner(){// add to library as a new module
                rotate(-90)
                difference(){
                translate([ -cylCenterCutRadius, -cylCenterCutRadius, 0])
                    cube_cut(cylCenterCutRadius * 2, cylCenterCutRadius * 2, baseThickness, 0, 0, 0); 

                translate([ -cylCenterCutRadius, -cylCenterCutRadius * 2, 0])
                    cube_cut(cylCenterCutRadius * 2, cylCenterCutRadius * 2, baseThickness, 0, 0, 0);

                translate([ -cylCenterCutRadius * 2, 0, 0])
                    cube_cut(cylCenterCutRadius * 2, cylCenterCutRadius * 2, baseThickness, 0, 0, 0);
                    
                    cylinder_cut( baseThickness, cylCenterCutRadius, true);
                }  
                    } 
    }
    


