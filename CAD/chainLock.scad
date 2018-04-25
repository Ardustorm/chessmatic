$fn=100;
thickness =1;

difference() {
   union(){
      cube([60,70,thickness],center=true);
      translate([0,0,thickness*3/2]) {
	 #cube([60,20,thickness*3],center=true);
      }
      translate([0,25,thickness*3/2])
	 #cube([30,20,thickness*3],center=true);
	 
      translate([0,-25,thickness*3/2])
	 #cube([30,20,thickness*3],center=true);
   }

   translate([25,-30,0])
      hole();
   translate([-25,-30,0])
      hole();

   translate([-25,30,0]) rotate([0,0,180])
      hole();
   translate([25,30,0]) rotate([0,0,180])
      hole();

   translate([0,30,0])
   cylinder(d=4,h=100,center=true);

   translate([0,-30,0])
   cylinder(d=4,h=100,center=true);

}

translate([0,0,-thickness/2]) {
   translate([25,-30,0])
      flap();
   translate([-25,-30,0])
      flap();

   translate([-25,30,0]) rotate([0,0,180])
      flap();
   translate([25,30,0]) rotate([0,0,180])
      flap();
}


module hole() {
   hull() {
      translate([0,5,0])
	 cylinder(d=2, h = 20, center=true);
      cylinder(d=1, h = 20, center=true);
   }
   translate([0,5,0])
      cylinder(d=5, h = 20, center=true);

}


module flap() {
   translate([0,6,.2]){
      cube([2,4,.4],center=true);
      translate([0,-1])
	 cylinder(d=4, h=.4, center=true);
   }

}
