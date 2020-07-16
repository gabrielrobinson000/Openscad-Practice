centeredCylinderCutRadius = 45;

centerCubeMainWidth = 210;
centerCubeMainDepth = 105;
centerCubeMainHeight = 140;

outsideCubeCutsWidth = 25;
    cubeHeightOffset = 60;
    cubeOffTheTop = 50;

InsideCubeCutHeight = 30;
InsideCubeCutWidth = 90;

centerCubeTallCutDepth = 40;
centerCubeTallCutHeight = 50;

topCylinderCutRadius = 37.50;


difference(){
    translate([ -centerCubeMainWidth / 2, 0, 0])
    cube([centerCubeMainWidth, centerCubeMainDepth, centerCubeMainHeight]);//Stock block
    
    rotate([ -90, 0, 0])
    cylinder(centerCubeMainDepth,r = centeredCylinderCutRadius,true);//Bottum cylinder cut
    
    translate([ -centerCubeMainWidth / 2, 0, cubeHeightOffset])
    cube([outsideCubeCutsWidth, centerCubeMainDepth, centerCubeMainHeight]);//Negative Outer Edge Cut
    
    translate([ centerCubeMainWidth / 2 - outsideCubeCutsWidth, 0, cubeHeightOffset])
    cube([outsideCubeCutsWidth, centerCubeMainDepth, centerCubeMainHeight]);//Negative Outer Edge Cut
    
    translate([-InsideCubeCutWidth / 2, 0,centerCubeMainHeight - cubeHeightOffset])
    cube([InsideCubeCutWidth, centerCubeMainDepth, InsideCubeCutHeight]);// Top Center Cut Wide
    
    translate([-centerCubeTallCutDepth / 2, 0,centerCubeMainHeight - centerCubeTallCutHeight])
    cube([centerCubeTallCutDepth, centerCubeMainDepth, centerCubeTallCutHeight]);// Top Center Cut Tall
    
    translate([0, centerCubeMainDepth / 2, centerCubeMainHeight - centerCubeTallCutHeight])
    cylinder(centerCubeTallCutHeight,r = topCylinderCutRadius);
}


hull(){
    translate([centerCubeMainWidth / 2 -outsideCubeCutsWidth, centerCubeMainDepth / 2 - outsideCubeCutsWidth / 2, cubeHeightOffset - outsideCubeCutsWidth])
    cube([outsideCubeCutsWidth, outsideCubeCutsWidth, outsideCubeCutsWidth]);
    
    translate([centerCubeMainWidth / 2 -outsideCubeCutsWidth * 2, centerCubeMainDepth / 2 - outsideCubeCutsWidth / 2,centerCubeMainHeight - outsideCubeCutsWidth])
    cube([outsideCubeCutsWidth, outsideCubeCutsWidth, outsideCubeCutsWidth]);
    }//Postive X slope triangles
    
    mirror([1,0,0])
    hull(){
    translate([centerCubeMainWidth / 2 -outsideCubeCutsWidth, centerCubeMainDepth / 2 - outsideCubeCutsWidth / 2, cubeHeightOffset - outsideCubeCutsWidth])
    cube([outsideCubeCutsWidth, outsideCubeCutsWidth, outsideCubeCutsWidth]);
    
    translate([centerCubeMainWidth / 2 -outsideCubeCutsWidth * 2, centerCubeMainDepth / 2 - outsideCubeCutsWidth / 2,centerCubeMainHeight - outsideCubeCutsWidth])
    cube([outsideCubeCutsWidth, outsideCubeCutsWidth, outsideCubeCutsWidth]);
    }//Postive X slope triangles