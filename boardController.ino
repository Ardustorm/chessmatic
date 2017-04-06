/*
  ESP8266 Blink by Simon Peter
  Blink the blue LED on the ESP-01 module
  This example code is in the public domain
 
  The blue LED on the ESP-01 module is connected to GPIO1 
  (which is also the TXD pin; so we cannot use Serial.print() at the same time)
 
  Note that this sketch uses LED_BUILTIN to find the pin with the internal LED
*/

//#include <AccelStepper.h>
#include <AFMotor.h>



long curX = 0;
long curY = 0;

AF_Stepper motorA(48, 1);
AF_Stepper motorB(48, 2);

void setup() {
   Serial.begin(9600);           // set up Serial library at 9600 bps
   Serial.println("Stepper test!");
 

}

// the loop function runs over and over again forever
void loop() {
   if (Serial.available() > 0) {
      int inByte = Serial.read();
            
      switch (inByte) {
      case 'c':
	 consumeLine();
	 Serial.print("Current position: (");
	 Serial.print(curX);
	 Serial.print(", ");
	 Serial.print(curY);
	 Serial.println(")");
	 break;
      case 'r':
	 consumeLine();
	 Serial.println("releasing motors");
	 release();
	 break;
      case 's':
	 consumeLine();
	 Serial.println("Setting home");
	 curX = 0;
	 curY = 0;
	 break;
      case 'g':
	 int x = Serial.parseInt();
	 int y = Serial.parseInt();
	 Serial.print("Going to ");
	 Serial.print( x );
	 Serial.print( ", " );
	 Serial.println( y );
	 goTo(x,y);
	 consumeLine();
	 break;
	    
    
      default:
	 consumeLine();
	 Serial.println("Something broke");
	 break;
      }
   }
}




void goTo(long newX, long newY) {
   int style = SINGLE;
   int step_delay = 1200;
   
   long dx=newX-curX; // distance to move (delta)
   long dy=newY-curY;
   long da = dx + dy;
   long db = dx - dy;
   int dirA= da > 0? FORWARD: BACKWARD; // direction to move
   int dirB= db > 0? FORWARD: BACKWARD;
   da=abs(da); // absolute delta
   db=abs(db);

   long i;
   long over=0;

   if(da > db) {
      for(i=0;i < da;++i) {
	 motorA.onestep(dirA, style);
	 over+=db;
	 if(over>=da) {
	    over-=da;
	    motorB.onestep(dirB, style);
	 }
	 delayMicroseconds(step_delay); // step_delay is a global connected to feed rate.
	 // test limits and/or e-stop here
      }
   } else {
      for(i=0;i < db;++i) {
	 motorB.onestep(dirB, style);
	 over+=da;
	 if(over>=db) {
	    over-=db;
	    motorA.onestep(dirA, style);
	 }
	 delayMicroseconds(step_delay); 
      }

   }
   curX = newX;
   curY = newY;
}

//Releases both motors
void release() {
   motorA.release();
   motorB.release();
}


void consumeLine() {
   if (Serial.available() > 0) {
      while(Serial.read() != '\n') {
      }
   }
}