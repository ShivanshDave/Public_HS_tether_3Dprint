$fn=50;
//translate([0,0,-5]){
//cube([15,15,5],center=true);}
difference()
{
    Polygon(N=6,R=5,h=22);
    translate([0,0,-5])
     {cylinder(r=3.21,h=16);} //Shaft_hole
}
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