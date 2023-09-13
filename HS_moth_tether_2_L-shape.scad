include <HS_moth_tether_0_variables.scad>

//----------------------------//
//L1:with shaft and bolt-socket
difference(){
 translate([0,-L1,0]){
 cube([wd,L1,wd]);}
////Shaft_hex
 translate([(wd/2),-11.5,(wd/2)]){rotate(a=90,v=[1,0,0]){
   Polygon(N=6,R=5.3,h=23.1);}}
////Bolt at shaft
 translate([(wd/2),-7,-1]){
 cylinder(r=r_bolt,h=wd+2);} //5 , 10
}


// Right-angle structure
translate([0,-L1,0]){
cube([wd,wd,L2]);}

translate([0,-(L1+L3-wd),(L2-wd)]){
cube([wd,L3,wd]);}

//Box with Ball-socket joint
difference(){
 translate([0,-(L1+L3),(L2-wd)]){
 cube([wd,wd,L4]);}
////Bolt
 translate([(wd/2),-(L1+L3-(wd/2)),(L2-wd)]){
 cylinder(r=r_bolt,h=L4+1);} // 1
////Ball_socket
 translate([(wd/2),-(L1+L3-(wd/2)),(L2-wd)]){
 sphere(r=r_ball_socket);}
}

//----------//
//-----------------------------//
// Polygon : 
module Polygon(N=3,A=0,R=0,S=0,h=0,debug=false)
{
	N = ( N < 3 ? 3 : N );
	angle = 360/N;
	angleA = angle/2;
	if ( A > 0 )		// if A assign R and S
	{
        S = 2 * A * tan(angleA); // assign
		//R = (S/2) / sin(angleA); // no assign ???
		R = ( A * tan(angleA) ) / sin(angleA);	// asign
		_Build_Polygon(N=N,R=R,h=h);
	}
	else
	{
		if ( S > 0 )		// if S assign R and A
		{
			R = (S/2) / sin(angleA); // assign
			A = S / ( 2 * tan(angleA) ); // assign
            _Build_Polygon(N=N,R=R,h=h);
		}
		else
		{
			if ( R == 0 )		// default
			{
				S = 2 * R * sin(angleA); // no assign ???
				A = S / ( 2 * tan(angleA) ); // no assign ???
				_Build_Polygon(N=N,h=h);
			}
			else		// build with R
			{
				S = 2 * R * sin(angleA);
				A = S / ( 2 * tan(angleA) );	// no assign ???
				//A = R * ( sin(angleA) / tan(angleA) )	// no assign ???
				_Build_Polygon(N=N,R=R,h=h);
			}
		}
	}
}

// Build
module _Build_Polygon(N=3,R=1,h=0)
{
	if (h > 0)
	{
		// 3D primitive h>0
		cylinder(r=R,h=h,$fn=N,center=true);
	}
	else
	{
		// 2D primitive h=0
		circle(r=R,$fn=N,center=true);
	}
}
/*
	Definition

	N = Number of Side N >=3
	A = apothem
		radius of inside circle
	R = circumradius
		Radius of outside circle
	S = Side
		Lenght of a side

	Build polygon with the Apothem :
	N and A is known
	Need to calculate S then R
	use $fn

	Build Polygon with Circumradius
	N and R known
	use $fn

	Build Polygon with Side
	N and S Known
	Need to calculate R and optionaly A
	use $fn	

	TO DO
    Control result

	For more information :
	http://en.wikipedia.org/wiki/Regular_polygon

*/