/*
Author: Ethan Kalika
Date: May 22, 2025
*/

turtleDrawer t;

void setup(){
  size(1500, 800);
  background(255);
  t = new turtleDrawer(0, 0);
  simulate();
}

void simulate() {
  rightRegion r1 = new rightRegion(50, 400, 400, 60, 10, 0);
  r1.drawFancyRightRegion();
  
  // Rotates the right region by 10 degrees each time the rotation function is called.
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
1. Displaying a Koch Curve and overlaying several polygogonal frameworks:
  // Creates and displayes one instance of the alpha koch curve. The width of the curve is 1,400 pixels, the alphs parameter is 15 degrees, and there are 6 layers of the curve. t helps draw the curve.
  kochCurve kochCurve1 = new kochCurve(1400, 725, 15, 6, t);
  kochCurve1.displayArc();
  
  // Creates and displayes more instances of other Koch curves.
  kochCurve kochCurve2 = new kochCurve(1400, 725, 30, 6, t);
  //kochCurve2.displayArc();
  kochCurve kochCurve3 = new kochCurve(1400, 725, 45, 6, t);
  //kochCurve3.displayArc();
  kochCurve kochCurve4 = new kochCurve(1400, 725, 60, 6, t);
  //kochCurve4.displayArc();
  kochCurve kochCurve5 = new kochCurve(1400, 725, 75, 6, t);
  //kochCurve5.displayArc();
  
2. Rotating subarcs of the koch cruve:
  kochCurve kochCurve1 = new kochCurve(1400, 400, 60, 3, t);
  kochCurve1.displayArc();
  
  // Rotates everything after the 10th vertex from the left end of the curve 20 degrees clockwise
  kochCurve1.rotateRightSubArc(10, 20);
  kochCurve1.displayArc();
  
  //Performs another rotation
  kochCurve1.rotateRightSubArc(50, 30);
  //kochCurve1.displayArc();
  
  kochCurve kochCurve2 = new kochCurve(1400, 725, 60, 6, t);
  //kochCurve2.displayArc();
  kochCurve2.rotateLeftSubArc(500, 50);
  //kochCurve2.displayArc();
  kochCurve2.rotateLeftSubArc(1500, 50);
  //kochCurve2.displayArc();
  
  // Left and right subarc rotations can be performed on the same polygonal arc
  kochCurve2.rotateRightSubArc(3000, 45);
  //kochCurve2.displayArc();
   
3. Make and draw a non-fancy right region and non-fancy left region:
  // The first two arguments are the x and y-coordinates of the left-most point. The third argument is the width of the region. The fourth argument is the alpha parameter of the inscribed alpha-Koch
  // curve. The last argument is the anlge used to create the buffer on the opposite end of the region.
  rightRegion r1 = new rightRegion(50, 700, 500, 60, 10);
  r1.drawRightRegion();
  
  leftRegion l1 = new leftRegion(1200, 100, 350, 45, 5);
  l1.drawLeftRegion();
   
4. Place left and right regions at different orientations and use fancy left and right region displayes:
  // The new argument is the clockwise rotation of the left or right region.
  rightRegion r1 = new rightRegion(50, 400, 400, 60, 10, 2);
  leftRegion l1 = new leftRegion(50, 400, 400, 60, 10, 270);
  
  // The fancy draw method draws the regions with color.
  r1.drawFancyRightRegion();
  l1.drawFancyLeftRegion();
  
  // By default, right regions will be in red and left regions will be in blue, but you can use extra arguemnts to change these colors.
  // The last 3 arguments are the RGB values for the color of the region.
  rightRegion r2 = new rightRegion(50, 400, 400, 60, 15, 10, 13, 168, 128);
  //r2.drawFancyRightRegion();
  leftRegion l2 = new leftRegion(100, 400, 250, 80, 8, 30, 254, 9, 133);
  //l2.drawFancyLeftRegion();
   
5. You can rotate left and right regions after they have been defined:
  rightRegion r1 = new rightRegion(50, 400, 400, 60, 10, 0);
  r1.drawFancyRightRegion();
  
  // Rotates the right region by 10 degrees each time the rotation function is called.
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
   
6. PVector p1 = new PVector(100, 50);
   PVector p2 = new PVector(150, 200);
   PVector p3 = new PVector(300, 500);
   PVector p4 = new PVector(200, 50);
   PVector p5 = new PVector(600, 600);
   ArrayList<PVector> myPoints = new ArrayList<PVector>();
   myPoints.add(p1);
   myPoints.add(p2);
   myPoints.add(p3);
   myPoints.add(p4);
   myPoints.add(p5);
   polyArc myArc = new polyArc(myPoints);
   myArc.displayArc();
  
   //Rotating right components of arc
   myArc.rotateRightCompontent(1, 45);
   //myArc.displayArc();
  
   //Rotating left components of arc
   myArc.rotateLeftCompontent(3, 45);
   //myArc.displayArc();
*/
