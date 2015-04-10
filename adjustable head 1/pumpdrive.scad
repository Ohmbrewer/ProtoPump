pump_inner_d=125;
tube_squish_w=25;
rim_h=tube_squish_w*1.5;
tol=1;
dia=sqrt(pow(pump_inner_d/2,2)-pow(rim_h/2,2))*2-tol;//119.2
hole=2;
thickness=2;
drive=6;

module screwpattern(offset){
	translate([0,(dia/2-hole*2)-offset,0]){cylinder(h=thickness,r=hole,center=true);}	
	translate([0,-(dia/2-hole*2)+offset,0]){cylinder(h=thickness,r=hole,center=true);}
	translate([(dia/2-hole*2)-offset,0,0]){cylinder(h=thickness,r=hole,center=true);}
	translate([-(dia/2-hole*2)+offset,0,0]){cylinder(h=thickness,r=hole,center=true);}
}


module pumpdrive(){
	os = 5;
	difference(){
		cylinder(h=thickness,d=dia,center=true);
		cylinder(d=drive,h=thickness,center=true,$fn=6);
		screwpattern(0);
		rotate(10,0,0){screwpattern(os);}
		rotate(20,0,0){screwpattern(os*2);}
		rotate(30,0,0){screwpattern(os*3);}
		rotate(40,0,0){screwpattern(os*4);}
		rotate(50,0,0){screwpattern(os*5);}
		
		rotate(50,0,0){screwpattern(os*1.5);}
		rotate(60,0,0){screwpattern(os*2.5);}
		rotate(70,0,0){screwpattern(os*3.5);}
		rotate(80,0,0){screwpattern(os*4.5);}
		rotate(90,0,0){screwpattern(os*5.5);}
	}
}
pumpdrive();