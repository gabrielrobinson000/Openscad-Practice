use <library.scad>
use <Room-Design-library.scad>
mm = 1;
degree = 1;
diameter = .5;
inch = mm * 25.4;
foot = 12 * inch;

InWallBed();

    //Long wall 2x4
for(Spacing = [0 : 16 * inch : 17 * foot]){
    translate([Spacing, 0, 0])
        TwoByFour();
    translate([Spacing, 4 * inch, 0])
        DryWall();
    translate([Spacing, 13 * foot, 0])
        TwoByFour();
    translate([Spacing, (13 * foot) , 0])
        DryWall();
}

    // Short Wall 2x4
for(Spacing = [0 : 16 * inch : 13 * foot]){
    translate([0, Spacing, 0])
        TwoByFour();
    translate([17 * foot, Spacing, 0])
        TwoByFour();
    }
    //Short Wall Dry Wall
for(Spacing = [2 * inch : 4 * foot : 12 * foot]){
    translate([2.25 * inch, Spacing, 0])
    rotate([0, 0, 90])
        DryWall();
    }

translate([5 * inch, foot, 3.4 * foot])
    Bed();
translate([17 * inch, 1.25 * foot, 3.4 * foot + 5 * inch])
    Pillow();

translate([13.75 * foot, 6 * inch, 0])
    Freezer();

translate([ 10 * foot, 6 * inch, 0])
    rotate([0, 0, 0])
        BookShelf();

translate([4 * inch,(8 * foot) + (6 * inch), 0])
    Shower();

//In Wall Bed and storage
module InWallBed(){
 difference(){
     union(){
        for(Spacing = [0 : 16 * inch : 9 * foot]){
            translate([50 * inch , Spacing, 0])
                TwoByFour(3.25 * foot);
            }
     
       for(Spacing = [2 * inch : 4 * foot : 12 * foot]){
            translate([52.25 * inch, Spacing, 0])
            rotate([0, 0, 90])
                DryWall();
            }
       for(Spacing = [0 : 16 * inch : 4 * foot]){
            translate([Spacing, 8 * foot, 0])
                TwoByFour();
            }
       for(Spacing = [16 * inch : 16 * inch : 3 * foot]){
            translate([Spacing + 3.125 * inch, 8 * foot, 3 * foot])
            rotate([90, -90, 0])
                TwoByFour();
            }
        translate([0, 8 * foot + 4 * inch, 0])
            DryWall();
        }
        translate([ 3.95 * foot, - inch, 5.45 * foot])
            hull(){
                rotate([90, 90, 90]){
                    cylinder(5 * inch,r = 1.5 * foot);
                translate([0,4.5 * foot,0])
                    cylinder(5 * inch,r = 1.5 * foot);
                }
            }
        translate([ 3.95 * foot, 8.35 * foot,- inch])
            cube([5 * inch, 4 * foot, 8.25 * foot]);
        
        translate([ 3.95 * foot, 2.25 * foot, -.05 * inch])
            cube([5 * inch, 4 * foot, 3 * foot]);
    }
    translate([2.25 * inch, 8 * foot, 3 * foot + 2 * inch])
    rotate([90, 0, 0])
        union(){
        translate([0,.53 * inch,0])
            DryWall();// is intented to be dense foam.
        PileWood4X8();
    }
}
