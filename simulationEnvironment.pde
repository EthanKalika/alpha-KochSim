/*
Author: Ethan Kalika
Date: May 22, 2025
*/

Turtle t;

void setup(){
  size(1500, 800);
  background(255);
  t = new Turtle(0, 0);
  simulate();
}

void simulate() {
  rightRegion r1 = new rightRegion(50, 400, 400, 60, 10, 0);
  r1.drawFancyRightRegion();
  r1.rotateRightRegion(10);
  r1.drawFancyRightRegion();
  r1.rotateRightRegion(10);
  r1.drawFancyRightRegion();
  r1.rotateRightRegion(10);
  r1.drawFancyRightRegion();
  r1.rotateRightRegion(10);
  r1.drawFancyRightRegion();
  r1.rotateRightRegion(10);
  r1.drawFancyRightRegion();
  r1.rotateRightRegion(10);
  r1.drawFancyRightRegion();
  r1.rotateRightRegion(10);
  r1.drawFancyRightRegion();
}

/* Example Simulations:
1. alphaSnowflake(1400, 60, 6, t);

2. alphaSnowflake(1400, 15, 6, t);
   alphaSnowflake(1400, 30, 6, t);
   alphaSnowflake(1400, 45, 6, t);
   alphaSnowflake(1400, 60, 6, t);
   alphaSnowflake(1400, 75, 6, t);
   
3. rightRegion r1 = new rightRegion(50, 700, 500, 60, 10);
   r1.drawRightRegion();
   
4. rightRegion r1 = new rightRegion(50, 400, 400, 60, 10, 2);
   leftRegion l1 = new leftRegion(50, 400, 400, 60, 10, 270);
   r1.drawFancyRightRegion();
   l1.drawFancyLeftRegion();
   
5. rightRegion r1 = new rightRegion(50, 400, 400, 60, 10, 0);
   r1.drawFancyRightRegion();
   r1.rotateRightRegion(10);
   r1.drawFancyRightRegion();
   r1.rotateRightRegion(10);
   r1.drawFancyRightRegion();
   r1.rotateRightRegion(10);
   r1.drawFancyRightRegion();
   r1.rotateRightRegion(10);
   r1.drawFancyRightRegion();
   r1.rotateRightRegion(10);
   r1.drawFancyRightRegion();
   r1.rotateRightRegion(10);
   r1.drawFancyRightRegion();
   r1.rotateRightRegion(10);
   r1.drawFancyRightRegion();
*/
