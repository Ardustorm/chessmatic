width= 7;
ballDia=4;
ballDist=4.5;
ballNum= 31;
pulleyDia= ballNum*ballDist / 3.14159265;

$fn=50;

difference(){
   cylinder(d=pulleyDia,h=width,center=true);

   intersection(){
      cube([4.5,20,15],center=true);
      cylinder(d=5.75, h = 15,center=true);
   }

   for(i = [0:360/ballNum:360]) {
      rotate([0,0,i])translate([pulleyDia/2,0,0]) sphere(d=ballDia);
      }
   /* difference() { */
   /*    cylinder(h=1, d=pulleyDia+2, center=true); */
   /*    cylinder(h=100, d=pulleyDia-ballDia/2, center=true); */

   /* } */

   rotate_extrude(convexity = 10)
      translate([pulleyDia/2-0/2, 0, 0])
      circle(d = ballDia/2, $fn = 100);

}

