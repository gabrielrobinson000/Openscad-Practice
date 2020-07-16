$fn = 50;
 difference(){
    cylinder(75, r = 30, r = 30,False);// main cylinder
    
    translate([ 0, 35, 60])rotate(a=[ 90, 90, 0])cylinder(70, d = 12,d = 12, True);// through hole on main cylinder
     
    translate([-35, -7.5, 15])cube([70, 15, 60], True);//center cut through main cylinder
     
    translate([ -40, 35/2,45])cube([80, 30, 30]); 
    
    mirror([ 0, 1, 0])translate([ -40, 35/2,45])cube([80, 30, 30]);
 }
 
difference(){
    hull(){
        cylinder(15, r = 30, r = 30,False);

        translate([ 75, 0, 0])
        cylinder( 15, r = 15, r =15, False);
        
        translate([ -75, 0, 0])
        cylinder( 15, r = 15, r =15, False);
    }
    
    translate([ 75, 0, 0])
        cylinder( 15, d = 15, d = 15, False);
        
        translate([ -75, 0, 0])
        cylinder( 15, d = 15, d =15, False);
    
    
    
}
