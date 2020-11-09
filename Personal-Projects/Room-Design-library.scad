use <library.scad>
mm = 1;
degree = 1;
diameter = .5;
inch = mm * 25.4;
foot = 12 * inch;

PartsShow();

module PartsShow(){
//Listed Parts
translate([0, 20 * inch, 0])
    DryWall();
    
translate([ 7 * inch,3 * foot, 0])
    TwoByFour();

translate([0, 10 * inch, 0])
    PileWood4X8();
    
translate([14 * inch,3 * foot, 0])
    FourXFour();

translate([3 * foot, 3 * foot, 0])    
    Bed();
    
translate([4 * foot, 3.25 * foot, 4 * inch])
    Pillow();

translate([5 * foot, 0, 0])
    BookShelf();

    ComputerScreen();

    LightPanel();

translate([10 * foot, 0, 0])    
    Sink();

translate([10 * foot, 4 *foot, 0])    
    Freezer();

    SolarPanel();

translate([10 * foot, 10 *foot, 0])
    Shower();

translate([5 * foot, 10 *foot, 0])
    Door();
}

//building blocks
module DryWall(){
// Variables
    Width = 4 * foot;
    Depth = .25 * inch;
    Height = 8 * foot;

// Main Coding Block
    cube([Width, Depth, Height]);
    }
module TwoByFour(Height){
// Variables
    Width = 2 * inch;
    Depth = 4 * inch;
    Height = 8 * foot;

// Main Coding Block
    cube([Width, Depth, Height]);
}
module PileWood4X8(){
// Variables
    Width = 4 * foot;
    Depth = .5 * inch;
    Height = 8 * foot;

// Main Coding Block
    cube([Width, Depth, Height]);   
    }
module FourXFour(Height){
// Variables
    Width = 4 * inch;
    Depth = 4 * inch;
    Height = 8 * foot;

// Main Coding Block
    cube([Width, Depth, Height]);
    }


// things in the room
module Bed(){
    hull(){
        Width = 47 * inch;
        Depth = 4 * inch;
        Height = 78 * inch;
        
    //Top Left Corner
        sphere(diameter * Depth);

    //Top Right Corner
        translate([Width - Depth, 0, 0])
            sphere(diameter * Depth);

    // Bottum Left Corner
        translate([0, Height - Depth, 0])
            sphere(diameter * Depth);
        
    //Bottum Right Corner
        translate([Width - Depth, Height - Depth, 0])
            sphere(diameter * Depth);
}
    }

module Pillow(){
    Width = 24 * inch;
    Depth = 5 * inch;
    Height = 16 * inch;
hull(){    
//Top Left Corner
    sphere(diameter * Depth);

//Top Right Corner
    translate([Width - Depth, 0, 0])
        sphere(diameter * Depth);

// Bottum Left Corner
    translate([0, Height - Depth, 0])
        sphere(diameter * Depth);
    
//Bottum Right Corner
    translate([Width - Depth, Height - Depth, 0])
        sphere(diameter * Depth);
}
    }
module BookShelf(){
    //full size Book shelf
      // 2 X 4 legs
        Depth2x4 = 2 * inch;
        Weight2x4 = 4 * inch;
        Height2x4 = 51 * inch;
        
        shelfOffset = 10 * inch;
    
            cube([Depth2x4, Weight2x4, Height2x4]);

        translate([3 * foot, 0, 0])
            cube([Depth2x4, Weight2x4, Height2x4]);

        translate([3 * foot, foot, 0])
            cube([Depth2x4, Weight2x4, Height2x4]);

        translate([0, foot, 0])
            cube([Depth2x4, Weight2x4, Height2x4]);

    // The Shelves
    translate([2 * inch, 0, shelfOffset])
        cube([3 * foot - Depth2x4, foot + 4 * inch, .5 * inch]);

    translate([2 * inch, 0, 2 * shelfOffset])
        cube([3 * foot - Depth2x4, foot + 4 * inch, .5 * inch]);

    translate([2 * inch, 0, 3 * shelfOffset])
        cube([3 * foot - Depth2x4, foot + 4 * inch, .5 * inch]);

    translate([2 * inch, 0, 4 * shelfOffset])
        cube([3 * foot - Depth2x4, foot + 4 * inch, .5 * inch]);

    translate([2 * inch, 0, 5 * shelfOffset])
        cube([3 * foot - Depth2x4, foot + 4 * inch, .5 * inch]);
    }
module ComputerScreen(){}
module LightPanel(){}
module Sink(){
    
    Width = 24 * inch;
    Depth = inch;
    Height = 16 * inch;
    
    WidthDiff = 23.75 * inch;
    DepthDiff = .75 * inch;
    HeightDiff = 15.75 * inch;
    
    difference(){
        SinkBowl();
     translate([0, 0, .25 * inch])
        SinkBowlDif();
        }
    
    module SinkBowl(){
        hull(){
        //Top Left Corner Top 
            translate([0, 0, 15 * inch])
            sphere(diameter * Depth);

        //Top Right Corner Top
            translate([Width - Depth, 0, 15 * inch])
                sphere(diameter * Depth);

        // Bottum Left Corner Top
            translate([0, Height - Depth, 15 * inch])
                sphere(diameter * Depth);
            
        //Bottum Right Corner Top
            translate([Width - Depth, Height - Depth, 15 * inch])
                sphere(diameter * Depth);
            

        //Top Left Corner Bottum 
            sphere(diameter * Depth);

        //Top Right Corner Bottum
            translate([Width - Depth, 0, 0])
                sphere(diameter * Depth);

        // Bottum Left Corner Bottum
            translate([0, Height - Depth, 0])
                sphere(diameter * Depth);
            
        //Bottum Right Corner Bottum
            translate([Width - Depth, Height - Depth, 0])
                sphere(diameter * Depth);
            }
        }


    module SinkBowlDif(){
        hull(){
        //Top Left Corner Top 
            translate([0, 0, 15 * inch])
            sphere(diameter * DepthDiff);

        //Top Right Corner Top
            translate([WidthDiff - DepthDiff, 0, 15 * inch])
                sphere(diameter * DepthDiff);

        // Bottum Left Corner Top
            translate([0, HeightDiff - DepthDiff, 15 * inch])
                sphere(diameter * DepthDiff);
            
        //Bottum Right Corner Top
            translate([WidthDiff - DepthDiff, HeightDiff - DepthDiff, 15 * inch])
                sphere(diameter * DepthDiff);
            

        //Top Left Corner Bottum 
            sphere(diameter * DepthDiff);

        //Top Right Corner Bottum
            translate([WidthDiff - DepthDiff, 0, 0])
                sphere(diameter * DepthDiff);

        // Bottum Left Corner Bottum
            translate([0, HeightDiff - DepthDiff, 0])
                sphere(diameter * DepthDiff);
            
        //Bottum Right Corner Bottum
            translate([WidthDiff - DepthDiff, HeightDiff - Depth, 0])
                sphere(diameter * DepthDiff);
            }
        }
}
module Freezer(){
    Width = 37.25 * inch;
    Depth = 21.75 * inch;
    Height = 33.5 * inch;
    edge = inch;
    R10 = (4 * inch) + inch;
    centering = R10 - inch;

    translate([centering / 2, centering / 2, Height])
    rotate([45, 0, 0])
        Lid();
    
    difference(){
        Outer();
    translate([centering / 2, centering / 2, centering / 2])
        Inner();
        }
module Lid(){
        hull(){
        //Top Left Corner Top 
            translate([0, 0, 0])
            sphere(diameter * edge);

        //Top Right Corner Top
            translate([Width - R10, 0, 0])
                sphere(diameter * edge);

        // Bottum Left Corner Top
            translate([0, Height - R10, 0])
                sphere(diameter * edge);
            
        //Bottum Right Corner Top
            translate([Width - R10, Height - R10, 0])
                sphere(diameter * edge);
        }    
    }
module Outer(){
        hull(){
        //Top Left Corner Top 
            translate([0, 0, Height])
            sphere(diameter * edge);

        //Top Right Corner Top
            translate([Width - edge, 0, Height])
                sphere(diameter * edge);

        // Bottum Left Corner Top
            translate([0, Height - edge, Height])
                sphere(diameter * edge);
            
        //Bottum Right Corner Top
            translate([Width - edge, Height - edge, Height])
                sphere(diameter * edge);
            

        //Top Left Corner Bottum 
            sphere(diameter * edge);

        //Top Right Corner Bottum
            translate([Width - edge, 0, 0])
                sphere(diameter * edge);

        // Bottum Left Corner Bottum
            translate([0, Height - edge, 0])
                sphere(diameter * edge);
            
        //Bottum Right Corner Bottum
            translate([Width - edge, Height - edge, 0])
                sphere(diameter * edge);
            }
        }

module Inner(){
        hull(){
        //Top Left Corner Top 
            translate([0, 0, Height])
            sphere(diameter * edge);

        //Top Right Corner Top
            translate([Width - R10, 0, Height])
                sphere(diameter * edge);

        // Bottum Left Corner Top
            translate([0, Height - R10, Height])
                sphere(diameter * edge);
            
        //Bottum Right Corner Top
            translate([Width - R10, Height - R10, Height])
                sphere(diameter * edge);
            

        //Top Left Corner Bottum 
            sphere(diameter * edge);

        //Top Right Corner Bottum
            translate([Width - R10, 0, 0])
                sphere(diameter * edge);

        // Bottum Left Corner Bottum
            translate([0, Height - R10, 0])
                sphere(diameter * edge);
            
        //Bottum Right Corner Bottum
            translate([Width - R10, Height - R10, 0])
                sphere(diameter * edge);
            }
        }
    }
module SolarPanel(){
    Depth = 1.57 * inch;
    Width = 39.06 * inch;
    Height = 77.01 * inch;
    
    rotate([-45, 0, 0])
    translate([0, 0, 8 * foot])
        cube([ Width, Height, Depth]);
    }
module Shower(){
        edge = inch;
        
        height = (6 * foot) + (8 * inch);
        base = (3 * foot) + (9 * inch);
        offSet = 3 * inch;
        
        difference(){
            cube([4 * foot, 4 * foot, 7 * foot]);
            translate([ 6 * inch, 6 * inch, 6 * inch])
                cube([4 * foot, 4 * foot, 7 * foot]);
            ShowerBowl();
        }
        
module ShowerBowl(){
    hull(){
    CutOut();
    
    translate([ 0, 0, height])
        CutOut();
    }
    }
module CutOut(){
            hull(){
                translate([ offSet, offSet, offSet])
                    sphere(diameter * edge);
                
                translate([base, offSet, offSet])
                    sphere(diameter * edge);
                
                translate([offSet, base, offSet])
                    sphere(diameter * edge);
                
                translate([base, base, offSet])
                    sphere(diameter * edge);
                }
            }
        }
module Door(){
    Width = 36 * inch;
    Depth = 2 * inch;
    Height = 80 * inch;
    holeSizeD = 2 * inch;
    handleInset = 3 * inch;
    
    difference(){
        cube([Width, Depth, Height]);
        
        translate([ handleInset, 0, holeSizeD + Height / 2])
        rotate([-90, 0, 0])
            cylinder(Depth, holeSizeD * diameter, holeSizeD * diameter);
        }
    }