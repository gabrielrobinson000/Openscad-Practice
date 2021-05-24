$fn = 100;
mm = 1;
degree = 1;
diameter = .5;
use <Library_2021.scad>

echo (sqrt(pow(150,2) + pow(150,2)));
x= 150; y = 150; z = 150; // point coordinates of end of cylinder
 
length = norm([x,y,z]);  // radial distance
b = acos(z/length); // inclination angle
c = atan2(y,x);     // azimuthal angle
Zoffset = 83 + 75;


p1=[-5,75,75];
p2=[75,-5,75];
p3=[75,75,-5];
Center=(p1+p2+p3)/3;

echo(len=sqrt(pow(Center[0],2)+pow(Center[1],2)+pow(Center[2],2)));


difference(){
cube([x,y,z],center= true); // corner of cube should coincide with end of cylinder
#rotate([0, b, c]) 
    cylinder(h=length, r=15, center= true);
#rotate([0, b, c])
translate([0,0,Zoffset])
    cube([x,y,z],center= true);
#rotate([0, b, c])
translate([0,0,-Zoffset])
    cube([x,y,z],center= true);
}