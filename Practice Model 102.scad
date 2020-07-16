$fn = 50;

// Post variables 
centerPostCut = 30;
centerPostHeight = 100;
centerPostRadius = 25;

// hull variables
twoMount = 12.5;
twoMountCut = 10;



difference(){
    cylinder(15,d = 100, d = 100);//circural base 
     
    for(hole = [0:360/6:360]){
         rotate([ 0, 0, hole])
         translate([35, 0, 0])
         cylinder(15,d = 12, d = 12);
         }//circural base through cuts  
    
    cylinder(centerPostHeight, d = centerPostCut, d =centerPostCut);//the post gut
 }
 
 
 
difference(){
    cylinder(centerPostHeight, r = centerPostRadius, r =centerPostRadius);//the post
 
    cylinder(centerPostHeight, d = centerPostCut, d =centerPostCut);//the post cut
 }



difference(){
    hull(){
        for(hole = [0:360/2:360]){
         rotate([ 0, 0, hole])
         translate([50, 0, centerPostHeight - 15])
         cylinder(15 ,r = twoMount , r = twoMount);
        }
        
         
        translate([0, 0, centerPostHeight - 15])cylinder(15, r = centerPostRadius, r =centerPostRadius);
      }
     
    for(whole = [0:360/2:360]){
       rotate([ 0, 0, whole])
         translate([50, 0, centerPostHeight - 15])
        cylinder(15 ,d = twoMountCut , d = twoMountCut);
    }
     
     translate([0, 0, centerPostHeight - 15])cylinder(15, d = centerPostCut, d =centerPostCut);//the post cut
 
   }