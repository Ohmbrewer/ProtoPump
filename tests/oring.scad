module outerring(){
	tubing_depth_clearance=10;
	outerring_outer_radius=200;
	tubing_od= 25;
	tubing_squished_width=39;
	nr=1;
	pitch=1;
	P=1;
	DR=1;
	tol=.15;
	helix_angle=1;
	T=1;
	
	difference()
	{
		// HACK: Add tubing depth clearance value to the total OD, otherwise the outer part may be too thin. FIXME: This is a quick n dirty way and makes the actual OD not match what the user entered...
		cylinder(r=D/2 + tubing_depth_clearance,h=T,center=true,$fn=100);
		exitholes(outerring_outer_radius-tubing_od/4,tubing_od, len=100);
		union()
		{
			// HACK: On my printer, it seems to need extra clearance for the outside gear, trying double...
			herringbone(nr,pitch,P,DR,-2*tol,helix_angle,T+0.2);
			cylinder(r=outerring_outer_radius+tubing_depth_clearance,h=tubing_squished_width,center=true,$fn=100);
			// overhang removal for top teeth of outer ring: create a frustum starting at the top surface of the "roller" cylinder 
			// (which will actually be cut out of the outer ring) and shrinking inward at the allowed overhang angle until it reaches the
			// gear root diameter.
			translate([0, 0, tubing_squished_width/2])
			{
				cylinder(r1=outerring_outer_radius+tubing_depth_clearance, r2=outerring_depth,h=abs(outerring_outer_radius+tubing_depth_clearance - outerring_depth)/tan(allowed_overhang*90),center=false,$fn=100);
			}
		}
	}
}
outerring();