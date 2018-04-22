
pulleyDia = 48;
pulleyHeight = 13;
holeDia=4.5;

$fn=100;

mirror([1,0,0])
difference() {
   hull(){
      translate([0,0,.001])
	 cylinder(d=52,h=pulleyHeight+6);

      translate([0,30,.001])
	 cylinder(d=30,h=pulleyHeight+6);

      translate([0,-30,.001])
	 cylinder(d=30,h=pulleyHeight+6);
      
   }

   translate([0,-36,-.001])
      cylinder(d=holeDia,h=pulleyHeight*5);

   translate([0,36,-.001])
      cylinder(d=holeDia,h=pulleyHeight*5);
	 
   
   /* slope */
   /* translate([0,20,0]) */
   /*    rotate([-85,0,0]) */
   /*    cylinder(d=22.5,h=30); */

   translate([30,0,0])
      cube([22.5,100,20], center=true);

   /* motor */
   union() {
      translate([-22.5/2,-12,0])
	 cube([22.5,150,20]);

	 hull() {
	 translate([0,0,6-.001])
	    cylinder(d=pulleyDia, h=pulleyHeight*2);

	 translate([pulleyDia,0,6-.001])
	    cylinder(d=pulleyDia*1.25, h=pulleyHeight,$fn=20);
	 
      }
   }
}
