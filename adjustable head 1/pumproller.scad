module roller(){
	//resize([40,30,40]){sphere(r=90,center=true);}
	surface_h=24;
	inside_d=125;
	rim=5;
	hole=3.5;
	roller_w=hole*6;
	roller_a_h=inside_d/roller_w*inside_d/surface_h*1.5;
	//translate([55,0,0]){sphere(d=inside_d,center=true);} //to test curvature match
	difference(){
		union(){
			cylinder(h=surface_h*1.5,r=hole*2,center=true);
			difference(){
				resize([roller_w,roller_w,roller_a_h]){sphere(d=inside_d,center=true);}
				translate([0,0,surface_h*1.5]){cylinder(h=inside_d/3,d=inside_d, center=true);}
				translate([0,0,-surface_h*1.5]){cylinder(h=inside_d/3,d=inside_d, center=true);}
			}
		}
		cylinder(h=surface_h*2,r=hole,center=true);
	}
}
roller();
//print all 4 at once//
//translate([25,0,0]){roller();}
//translate([25,25,0]){roller();}
//translate([0,25,0]){roller();}