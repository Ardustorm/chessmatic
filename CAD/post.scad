pulleyDia = 30;
ballDia=4.5;

$fn=100;


difference() {
   union(){
      cylinder(d=pulleyDia+ballDia/2, h = ballDia*3, center=true);
      translate([0,pulleyDia/2+ballDia/4 +1,0])
	 cube([2,5,ballDia*3],center=true);
      translate([pulleyDia/2+ballDia/4 +1, 0,0])
	 cube([5,2,ballDia*3],center=true);
   }


   translate([0,0,ballDia/2])
   cylinder(d=pulleyDia - 1.5*ballDia, h = ballDia*3, center=true);

   cylinder(d=ballDia, h = ballDia*10, center=true);
   
   translate([0,0,-ballDia/2 -.5])
      ring();

   translate([0,0,ballDia/2 +.5])
      ring();
}

module ring() {
   
rotate_extrude(convexity = 10)
translate([pulleyDia/2, 0, 0])
union(){
   translate([ballDia*.6/2, 0, 0])
      square([ballDia*.6,ballDia],center=true);
   circle(d = ballDia);
}


}
