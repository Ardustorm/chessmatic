$fn=100;


difference(){
   hull() {

      translate([0,5,0])
	 cylinder(d=10, h = 1);
      cylinder(d=7, h = 1);
   }   
   hole();
}

flap();   

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
	 cylinder(d=4, h=.44);
   }

}
