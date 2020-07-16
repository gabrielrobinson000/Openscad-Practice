$fn = 50;
//variables
outerCircleRadius = 50;
cutCircleDiameter = 50;
circularMountThickness = 100;
interCenterLength = 200;
squaredRadius = 100;
squareDepth = 35;

difference(){
    hull(){
        cylinder(circularMountThickness,r = outerCircleRadius);
        
        translate([ - circularMountThickness / 2, interCenterLength, circularMountThickness / 2 ])
        rotate([0,90,0])
        cylinder(circularMountThickness,r = outerCircleRadius);
    }
    
    
        cylinder(circularMountThickness,d = outerCircleRadius);

        translate([ 0, 0, circularMountThickness - (squareDepth / 2)])
        cube([squaredRadius, squaredRadius, squareDepth], true);
        
        translate([ 0, 0, (squareDepth / 2)])
        cube([squaredRadius, squaredRadius, squareDepth], true);
        
        mirror([0, 0, 0])
        translate([ (circularMountThickness / 2) - squareDepth, interCenterLength - outerCircleRadius, 0])
        cube([squareDepth, squaredRadius, squaredRadius]);
        
        mirror([1, 0, 0])
        translate([ (circularMountThickness / 2) - squareDepth, interCenterLength - outerCircleRadius, 0])
        cube([squareDepth, squaredRadius, squaredRadius]);
    
    
    hull(){
        translate([ - circularMountThickness / 2, interCenterLength, circularMountThickness / 2 ])
        rotate([0,90,0])
        cylinder(circularMountThickness,d = cutCircleDiameter);
        
        translate([ - circularMountThickness / 2, interCenterLength + cutCircleDiameter, circularMountThickness / 2 ])
        rotate([0,90,0])
        cylinder(circularMountThickness,d = cutCircleDiameter);
      }
}