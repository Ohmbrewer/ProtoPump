//set up for 5/8 in OD tubing currently all measurements are in mm
module pumprim(){
	tube_d=18;
	tube_squish_w=25;
	tube_squish_thick=4;
	outside_d=135;
	rim_thick=5;
	
	hole_offset=(outside_d/2-rim_thick*2.75);
	difference(){
		
		cube([outside_d,outside_d,tube_squish_w*1.5],center=true);
		sphere(d=outside_d-rim_thick*1.25);
		translate([hole_offset-rim_thick*.75,-outside_d/6.1,0]){rotate([90,0,9.5]){cylinder(h=outside_d/3,d1=tube_d*2,d2=tube_d,center=true);}}
		translate([hole_offset,0,0]){rotate([90,0,0]){cylinder(h=outside_d/2+10,d=tube_d);}}
		//translate([hole_offset,-(outside_d/6),0]){rotate([90,0,0]){cube([tube_d,tube_squish_w,outside_d/3],center=true);}}
		//translate([-80,-10,0]){rotate([90,0,0]){cylinder(h=110,r=tube_d);}}
		//translate([-hole_offset-tube_d,-10,0]){rotate([90,0,-11]){cylinder(h=50,d1=tube_d*2,d2=tube_d);}}
		//translate([-hole_offset,-50,0]){rotate([90,0,0]){cylinder(h=outside_d/2+10,d=tube_d);}}
		translate([-hole_offset,0,0]){rotate([90,0,0]){cylinder(h=outside_d/2+10,d=tube_d);}}
		translate([-hole_offset+rim_thick*.75,-outside_d/6.1,0]){rotate([90,0,-9.5]){cylinder(h=outside_d/3,d1=tube_d*2,d2=tube_d,center=true);}}
		//translate([-hole_offset,-(outside_d/6),0]){rotate([90,0,0]){cube([tube_d,tube_squish_w,outside_d/3],center=true);}}
//holes through body
	translate([hole_offset,hole_offset,0]){cylinder(h=outside_d/2+10,d=tube_d,center=true);}
	translate([-hole_offset,hole_offset,0]){cylinder(h=outside_d/2+10,d=tube_d,center=true);}
	
//front holes
	//translate([hole_offset,-hole_offset,0]){cylinder(h=outside_d/2+10,d=tube_d,center=true);}
	//translate([-hole_offset,-hole_offset,0]){cylinder(h=outside_d/2+10,d=tube_d,center=true);}
	}
	
}
pumprim();