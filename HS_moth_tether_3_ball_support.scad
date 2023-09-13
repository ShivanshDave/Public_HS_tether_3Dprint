// V2

include <HS_moth_tether_0_variables.scad>

//-----------------------------//
//Tether_ball_support

translate([0,-(L1+L3),L2-wd-45]){ // 4
   difference(){
    cube([wd,1.5*wd,(0.7*r_ball)]);
////Ball_lower_socket
    translate([wd/2,wd/2,(0.7*r_ball)+0.1]){
    sphere(r=r_ball_socket);}
   }
   
   temp=0.5;
   translate([0,0,-temp]){
    difference(){
       cube([wd,1.5*wd,temp]);
       translate([wd/2,wd/2,-temp]){
       cylinder(r=r_tether+0.7, h=h_tether);}
    }
   }
   
}


//----------------------------//
//Boll-stick
translate([(wd/2),-(L1+L3-(wd/2)),(L2-wd-1.7)]){ //1.7
    sphere(r=r_ball);

    translate([0,0,(r_ball/2)-h_tether]){
       difference(){
        translate([0,3.5,10]){rotate(a=90,v=[1,0,0]){
        cylinder(r=r_tether_bolt_case,h=h_tether_bolt_case-1);}}
        translate([0,17.5,10]){rotate(a=90,v=[1,0,0]){
        cylinder(r=r_tether_bolt,h=h_tether_bolt_case+100);}}
        cylinder(r=r_tether_hole,h=h_tether);
       }
       difference()
       {
        cylinder(r=r_tether,h=h_tether);
        translate([0,7.5,10]){rotate(a=90,v=[1,0,0]){
        cylinder(r=r_tether_bolt,h=h_tether_bolt_case);}}
        translate([0,0,-1]){ //-1
        cylinder(r=r_tether_hole,h=h_tether-10);}
       }
    }
  //  cylinder(r=r_tether+0.65, h=h_tether+100);
}    

