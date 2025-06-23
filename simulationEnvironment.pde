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
  kochCurve curve1 = new kochCurve(700, 350, 400, 60, 1, t);
  //curve1.displayArc();
  lRPair pair1 = new lRPair(curve1, true, true, 10);
  //pair1.displayPair();
  //pair1.displayFancyPair();
  
  // Apply the 4 phi transformations to the L-R pair
  lRPair pair2 = pair1.phi1();
  lRPair pair3 = pair1.phi2();
  lRPair pair4 = pair1.phi3();
  lRPair pair5 = pair1.phi4();
  //pair2.displayPair();
  //pair3.displayPair();
  //pair4.displayPair();
  //pair5.displayPair();
  //pair2.displayFancyPair();
  //pair3.displayFancyPair();
  //pair4.displayFancyPair();
  //pair5.displayFancyPair();
  
  // Rotate the L-R pair and perform the phi functions again
  pair1.rotatePair(100, 200, 25);
  pair1.displayPair();
  
  lRPair pair6 = pair1.phi1();
  lRPair pair7 = pair1.phi2();
  lRPair pair8 = pair1.phi3();
  lRPair pair9 = pair1.phi4();
  //pair6.displayPair();
  //pair7.displayPair();
  //pair8.displayPair();
  //pair9.displayPair();
  pair6.displayFancyPair();
  pair7.displayFancyPair();
  pair8.displayFancyPair();
  pair9.displayFancyPair();
}

/* Example Simulations:
1. Displaying a Koch Curve and overlaying several polygogonal frameworks:
  // Creates and displayes one instance of the alpha koch curve. The first argument is the width of the curve. The second and third arguments are the x and y-coordinates of the start point of the curve.
  // The fourth argument is the alpha parameter of the curve and the fifth argument is the degree of the curve. The last argument, t, is just there to assist in the process of drawing the curve.
  kochCurve kochCurve1 = new kochCurve(1400, 50, 725, 15, 6, t);
  kochCurve1.displayArc();
  
  // Creates and displayes more instances of other Koch curves.
  kochCurve kochCurve2 = new kochCurve(650, 50, 300, 30, 6, t);
  //kochCurve2.displayArc();
  kochCurve kochCurve3 = new kochCurve(650, 750, 300, 45, 6, t);
  //kochCurve3.displayArc();
  kochCurve kochCurve4 = new kochCurve(650, 50, 725, 60, 6, t);
  //kochCurve4.displayArc();
  kochCurve kochCurve5 = new kochCurve(650, 750, 725, 75, 6, t);
  //kochCurve5.displayArc();
  
2. Rotating subarcs of the koch cruve:
  kochCurve kochCurve1 = new kochCurve(1400, 50, 400, 60, 3, t);
  kochCurve1.displayArc();
  
  // Rotates everything after the 10th vertex from the left end of the curve 20 degrees clockwise
  kochCurve1.rotateRightSubArc(10, 20);
  kochCurve1.displayArc();
  
  //Performs another rotation
  kochCurve1.rotateRightSubArc(50, 30);
  //kochCurve1.displayArc();
  
  kochCurve kochCurve2 = new kochCurve(1400, 50, 725, 60, 6, t);
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
  r1.displayRightRegion();
  
  leftRegion l1 = new leftRegion(1200, 100, 350, 45, 5);
  l1.displayLeftRegion();
   
4. Place left and right regions at different orientations and use fancy left and right region displayes:
  // The new argument is the clockwise rotation of the left or right region.
  rightRegion r1 = new rightRegion(50, 400, 400, 60, 10, 2);
  leftRegion l1 = new leftRegion(50, 400, 400, 60, 10, 270);
  
  // The fancy draw method draws the regions with color.
  r1.displayFancyRightRegion();
  l1.displayFancyLeftRegion();
  
  // By default, right regions will be in red and left regions will be in blue, but you can use extra arguemnts to change these colors.
  // The last 3 arguments are the RGB values for the color of the region.
  rightRegion r2 = new rightRegion(50, 400, 400, 60, 15, 10, 13, 168, 128);
  //r2.displayFancyRightRegion();
  leftRegion l2 = new leftRegion(100, 400, 250, 80, 8, 30, 254, 9, 133);
  //l2.displayFancyLeftRegion();
   
5. You can rotate left and right regions after they have been defined:
  rightRegion r1 = new rightRegion(50, 400, 400, 60, 10, 0);
  r1.displayFancyRightRegion();
  
  // Rotates the right region by 10 degrees each time the rotation function is called.
  r1.rotateRightRegion(10);
  r1.displayFancyRightRegion();
  r1.rotateRightRegion(10);
  r1.displayFancyRightRegion();
  r1.rotateRightRegion(10);
  r1.displayFancyRightRegion();
  r1.rotateRightRegion(10);
  r1.displayFancyRightRegion();
  r1.rotateRightRegion(10);
  r1.displayFancyRightRegion();
  r1.rotateRightRegion(10);
  r1.displayFancyRightRegion();
  r1.rotateRightRegion(10);
  r1.displayFancyRightRegion();
   
6. Create and rotate subarcs of arbitrary polygonal arc:
  // To create an arbitrary subarc you need to explicitly define each point and make them into an ArrayList. These lines create the points.
  PVector p1 = new PVector(100, 50);
  PVector p2 = new PVector(150, 200);
  PVector p3 = new PVector(300, 500);
  PVector p4 = new PVector(200, 50);
  PVector p5 = new PVector(600, 600);
  
  // These lines declare the ArrayList and populates it with points.
  ArrayList<PVector> myPoints = new ArrayList<PVector>();
  myPoints.add(p1);
  myPoints.add(p2);
  myPoints.add(p3);
  myPoints.add(p4);
  myPoints.add(p5);
  
  // These lines declare the polygonal arc and display it.
  polyArc myArc = new polyArc(myPoints);
  myArc.displayArc();
  
  //Rotating right components of arc. This rotation is done about the second vertex from the left because the vertices are zero indexed.
  myArc.rotateRightSubArc(1, 45);
  //myArc.displayArc();
  
  //Rotating left components of arc. This rotation is done about the fourth vertex from the left because the vertices are zero indexed.
  myArc.rotateLeftSubArc(3, 45);
  //myArc.displayArc();
  
7. Constructors and displaye functions for L-R Pairs 
  // Create and display an LRPairs in all posible ways
  lRPair pair1 = new lRPair(true, true, 75, 300, 400, 300, 15, 30, 3, 67, 24, 102, 55, 221, 174, 42, 1);
  lRPair pair2 = new lRPair(60, 200, 350, 400, 15, 6, 135, 17, 48, 165, 46, 228, 139, 224, 243);
  lRPair pair3 = new lRPair(true, true, 40, 300, 400, 300, 10, 20);
  lRPair pair4 = new lRPair(true, true, 45, 300, 400, 300, 8);
  lRPair pair5 = new lRPair(60, 300, 400, 300, 10, 15);
  lRPair pair6 = new lRPair(80, 300, 400, 300, 20);
  
  // Display all of the pairs using the regular and fancy methods
  //pair1.displayPair();
  //pair1.displayFancyPair();
  //pair2.displayPair();
  //pair2.displayFancyPair();
  //pair3.displayPair();
  //pair3.displayFancyPair();
  //pair4.displayPair();
  //pair4.displayFancyPair();
  //pair5.displayPair();
  //pair5.displayFancyPair();
  //pair6.displayPair();
  //pair6.displayFancyPair();
  
8. Use the L-R Pair functions for rotating and setting functions
  lRPair pair1 = new lRPair(true, true, 75, 300, 400, 300, 15, 30, 3, 67, 24, 102, 55, 221, 174, 42, 1);
  
  // Displaye the pair
  //pair1.displayPair();
  pair1.displayFancyPair();
  
  // Rotate the pair and displaye it again
  pair1.rotateLRPair(600, 200, 15);
  //pair1.displayPair();
  //pair1.displayFancyPair();
  
  // Rotate it using differnt arguments
  pair1.rotateLRPair(20);
  //pair1.displayPair();
  //pair1.displayFancyPair();
  
  // Use the setL and setR functions
  pair1.setL(false);
  //pair1.displayPair();
  //pair1.displayFancyPair();
  pair1.setL(true);
  pair1.setR(false);
  //pair1.displayPair();
  //pair1.displayFancyPair();

9. Creating regions based on a given alpha-Koch Curve
  kochCurve curve1 = new kochCurve(700, 350, 550, 60, 1, t);
  curve1.displayArc();
  
  // Create the circumscribing right region and the corresponding left region
  rightRegion r1 = new rightRegion(curve1, 15);
  leftRegion l1 = new leftRegion(curve1, 15);
  r1.displayRightRegion();
  //l1.displayLeftRegion();
  
  // Create the L-R pair corresponding to the curve
  lRPair pair1 = new lRPair(curve1, true, true, 15);
  //pair1.displayPair();
  //pair1.displayFancyPair();
  
10. Applying the 4 phi transformations to left and right regions
  kochCurve curve1 = new kochCurve(700, 350, 400, 60, 1, t);
  curve1.displayArc();
  
  // Create the circumscribing right region and the corresponding left region
  rightRegion r1 = new rightRegion(curve1, 15);
  leftRegion l1 = new leftRegion(curve1, 15);
  r1.displayRightRegion();
  //l1.displayLeftRegion();
  
  // Apply the phi maps to the right region
  rightRegion r2 = r1.phi1();
  rightRegion r3 = r1.phi2();
  rightRegion r4 = r1.phi3();
  rightRegion r5 = r1.phi4();
  r2.displayRightRegion();
  r3.displayRightRegion();
  r4.displayRightRegion();
  r5.displayRightRegion();
  //r2.displayFancyRightRegion();
  //r3.displayFancyRightRegion();
  //r4.displayFancyRightRegion();
  //r5.displayFancyRightRegion();
  
  // Apply the phi maps to the left region
  leftRegion l2 = l1.phi1();
  leftRegion l3 = l1.phi2();
  leftRegion l4 = l1.phi3();
  leftRegion l5 = l1.phi4();
  //l2.displayLeftRegion();
  //l3.displayLeftRegion();
  //l4.displayLeftRegion();
  //l5.displayLeftRegion();
  //l2.displayFancyLeftRegion();
  //l3.displayFancyLeftRegion();
  //l4.displayFancyLeftRegion();
  //l5.displayFancyLeftRegion();
  
  // Repeat but with rotated left and right region
  r1.rotateRightRegion(40);
  l1.rotateLeftRegion(40);
  //r1.displayRightRegion();
  //l1.displayLeftRegion();
  
  rightRegion r6 = r1.phi1();
  rightRegion r7 = r1.phi2();
  rightRegion r8 = r1.phi3();
  rightRegion r9 = r1.phi4();
  //r6.displayRightRegion();
  //r7.displayRightRegion();
  //r8.displayRightRegion();
  //r9.displayRightRegion();
  //r6.displayFancyRightRegion();
  //r7.displayFancyRightRegion();
  //r8.displayFancyRightRegion();
  //r9.displayFancyRightRegion();
  
  leftRegion l6 = l1.phi1();
  leftRegion l7 = l1.phi2();
  leftRegion l8 = l1.phi3();
  leftRegion l9 = l1.phi4();
  //l6.displayLeftRegion();
  //l7.displayLeftRegion();
  //l8.displayLeftRegion();
  //l9.displayLeftRegion();
  //l6.displayFancyLeftRegion();
  //l7.displayFancyLeftRegion();
  //l8.displayFancyLeftRegion();
  //l9.displayFancyLeftRegion();
  
11. Applying the 4 phi transformations to L-R pairs
  kochCurve curve1 = new kochCurve(700, 350, 400, 60, 1, t);
  curve1.displayArc();
  lRPair pair1 = new lRPair(curve1, true, true, 10);
  pair1.displayPair();
  //pair1.displayFancyPair();
  
  // Apply the 4 phi transformations to the L-R pair
  lRPair pair2 = pair1.phi1();
  lRPair pair3 = pair1.phi2();
  lRPair pair4 = pair1.phi3();
  lRPair pair5 = pair1.phi4();
  //pair2.displayPair();
  //pair3.displayPair();
  //pair4.displayPair();
  //pair5.displayPair();
  pair2.displayFancyPair();
  pair3.displayFancyPair();
  pair4.displayFancyPair();
  pair5.displayFancyPair();
  
  // Rotate the L-R pair and perform the phi functions again
  pair1.rotatePair(100, 200, 25);
  //pair1.displayPair();
  
  lRPair pair6 = pair1.phi1();
  lRPair pair7 = pair1.phi2();
  lRPair pair8 = pair1.phi3();
  lRPair pair9 = pair1.phi4();
  //pair6.displayPair();
  //pair7.displayPair();
  //pair8.displayPair();
  //pair9.displayPair();
  //pair6.displayFancyPair();
  //pair7.displayFancyPair();
  //pair8.displayFancyPair();
  //pair9.displayFancyPair();
*/
