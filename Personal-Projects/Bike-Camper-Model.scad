use <library.scad>
$fn = 100;
mm = 1;
foot = 304.8 * mm;
inch = 25.4 * mm;

degree = 1;
diameter = .5;


    AL_Frame();
    insulationRearPlate();
    wheelWells();
    insulationBoard();
    translate([-5 * inch,0, 10 * inch])
        CamperShell();

    rearBar = 35.75 * inch;
module AL_Frame()color("#99DDDD55"){

    MainBar = 69.75 * inch;
    outerBar = 59.25 * inch;
    frontBar = 23.25 * inch;
    connectBar = 6.25 * inch;

    rotate([ 90, 0, 0])
        anulus_cube(inch, inch, .75 * inch, .75 * inch, rearBar);//rear bar
    
    translate([MainBar / 2, -(frontBar / 2) + inch / 2,0 ])
    rotate([0, 90, 0])
        anulus_cube(inch, inch, .75 * inch, .75 * inch, MainBar);//main length bar Right
    
    translate([MainBar / 2, (frontBar / 2) - inch / 2,0])
    rotate([0, 90, 0])
        anulus_cube(inch, inch, .75 * inch, .75 * inch, MainBar);//main length bar Left
    
    translate([-inch / 2 + outerBar / 2, rearBar / 2 - inch / 2, 0])
    rotate([0, 90, 0])
        anulus_cube(inch, inch, .75 * inch, .75 * inch, outerBar);//outer bar Right
    
    translate([-inch / 2 + outerBar / 2, -rearBar / 2 + inch / 2, 0])
    rotate([0, 90, 0])
        anulus_cube(inch, inch, .75 * inch, .75 * inch, outerBar);//outer bar Left
    
    translate([MainBar - inch / 2,0,0 ])
    rotate([0, 90, 90])
        anulus_cube(inch, inch, inch * .75, inch * .75, frontBar);// front bar

    translate([outerBar - inch, -frontBar / 2 - connectBar / 2 ,0])
    rotate([0, 90, 90])
        anulus_cube(inch, inch, inch * .75, inch * .75, connectBar);// connect bar Left middle
        
    translate([outerBar - inch, frontBar / 2 + connectBar / 2 ,0 ])
    rotate([0, 90, 90])
        anulus_cube(inch, inch, inch * .75, inch * .75, connectBar);// connect bar Right middle
    
    translate([outerBar / 2, -frontBar / 2 - connectBar / 2 ,0])
    rotate([0, 90, 90])
        anulus_cube(inch, inch, inch * .75, inch * .75, connectBar);// connect bar Left middle
        
    translate([outerBar / 2, frontBar / 2 + connectBar / 2 ,0 ])
    rotate([0, 90, 90])
        anulus_cube(inch, inch, inch * .75, inch * .75, connectBar);// connect bar Right middle

}

module wheelMount(){
    
    }

module insulationBoard(){
    // R-4 Laminated Expanded Polystyrene Foam Board Insulation 1" x 4' x 8'
    difference(){
        translate([ - inch / 2, - 2 * foot, inch / 2])
            cube([8 * foot, 4 * foot,inch]);// insulation Plate 

        translate([5.82 * foot, - 2 * foot, inch / 2])//First end cut
            cube([2.25 * foot, 4 * foot, inch]);
        
        translate([-inch / 2, rearBar / 2, inch / 2])//Left cut
            cube([8 * foot, 7 * inch, inch]);

        translate([-inch / 2, -rearBar/2 - 7 * inch, inch / 2])//Right cut
            cube([8 * foot, 7 * inch, inch]);

        translate([-inch / 2, rearBar / 2 - 6 * inch, inch / 2])//Left wheel cut
            cube([2.45 * foot, 6 * inch, inch]);

        translate([-inch / 2, -rearBar/2 , inch / 2])//Right wheel cut
            cube([2.45 * foot, 6 * inch, inch]);
               
        translate([6 * foot, foot, 0])// Left front Cut
        rotate([0,0,65])
            cube([foot, 2 * foot, foot]);

        mirror([0, 1, 0])
        translate([6 * foot, foot, 0])// Left front Cut
        rotate([0,0,65])
            cube([foot, 2 * foot, foot]);

    }
    }
    
module CamperShell(){
    difference(){
        hull(){
            translate([5.25 * foot, 0, 0])
                sphere(rearBar * diameter);
            
            translate([5.25 * foot, 0, -10 * inch])
                sphere(rearBar * diameter);                  

            translate([0, 0, 0])
                sphere(rearBar * diameter);
            
            translate([0, 0, -10 * inch])
                sphere(rearBar * diameter);                  
        }
        
        hull(){
            translate([5.25 * foot, 0, 0])
                sphere((rearBar * .95) * diameter);
            
            translate([5.25 * foot, 0, -10 * inch])
                sphere((rearBar * .95) * diameter);                  

            translate([0, 0, 0])
                sphere((rearBar * .95) * diameter);
            
            translate([0, 0, -10 * inch])
                sphere((rearBar * .95) * diameter);                  
        }            

        translate([-2 * foot, - rearBar / 2, - 4 * foot])
            cube([10 * foot, 4 * foot, 3 * foot]);

        translate([-4 * foot, -2 * foot, -2 * foot])
            cube([4 * foot, 4 * foot, 4 * foot]);
        }
    }
module insulationRearPlate()color("DeepPink"){
    difference(){
    hull(){
        difference(){
            translate([ -1.5 * inch, 0, 10 * inch])
            rotate([0, 90, 0])
                cylinder(inch, rearBar * diameter, rearBar * diameter);
            
           translate([ -1.5 * inch, 0, 15 * inch])
            rotate([0, 90, 0])
                cylinder(inch, 5 * inch, 5 * inch);

            translate([-1.5 * inch, -1.5 * foot, -10 * inch])
                cube([inch, 3 * foot, 20 * inch]);
        }
        translate([-1.5 * inch, -1.5 * foot, 0])
            cube([inch, rearBar, 8 * inch]);
    }
           translate([ -1.5 * inch, 0, 15 * inch])
            rotate([0, 90, 0])
                cylinder(inch, 5 * inch, 5 * inch);
    }
    }
module wheelWells(){
    translate([foot + 2.25 * inch, foot + 2.5 * inch, 4 * inch])// Left Wheel well
        anulus_cube(30 * inch, 6 * inch, 29 * inch, 5 * inch, 7 * inch);

    translate([foot + 2.25 * inch, -foot - 2.5 * inch, 4 * inch])// Right Wheel Well
        anulus_cube(30 * inch, 6 * inch, 29 * inch, 5 * inch, 7 * inch);
    
    translate([-.75 * inch, foot - .5 * inch , 7 * inch])//Left Wheel Well Cover
        cube([30 * inch, 6 * inch, inch]);

    translate([-.75 * inch, -foot - 5.5 * inch , 7 * inch])//Right Wheel Well Cover
        cube([30 * inch, 6 * inch, inch]);
    }