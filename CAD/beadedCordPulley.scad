width= 7;
ballDia=4;
ballDist=4.4;
ballNum= 31;
chainDia=1.2;
pulleyDia= ballNum*ballDist / 3.14159265;

$fn=50;

difference(){
   cylinder(d=pulleyDia,h=width,center=true, $fn=ballNum*2);

   intersection(){
      cube([4.25,20,15],center=true);
      cylinder(d=5.7, h = 15,center=true);
   }

   for(i = [0:360/ballNum:360]) {
      rotate([0,0,i])translate([pulleyDia/2,0,0]){
	 /* sphere(d=ballDia); */
	 rotate([0,90,0])
	    cylinder(d=ballDia, h=ballDia,center=true);
      }
      }
   /* difference() { */
   /*    cylinder(h=1, d=pulleyDia+2, center=true); */
   /*    cylinder(h=100, d=pulleyDia-ballDia/2, center=true); */

   /* } */

   rotate_extrude(convexity = 10)
      translate([pulleyDia/2-0/2, 0, 0])
      circle(d = chainDia);

}

