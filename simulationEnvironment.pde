/*
Author: Ethan Kalika
Date: May 22, 2025
*/

// YOU ONLY NEED TO MODIFY THE CODE IN THE SIMULATE() BLOCK, THE ENGINE WILL HANDEL EVERYTHING ELSE.

// THESE ARE GLOBAL VARIABLES, DO NOT MODIFY THESE 3 LINES OF CODE.
static TurtleDrawer t;  // This is an object used internally by the program to help draw polygonal arcs.
ArrayList<Action> actionQueue = new ArrayList<Action>();  // This is used to store the actions that need to be perforemd on the framework.
int currentActionIndex;  // This is used to keep track of the which action is currently being performed.

// ONLY MODIFY THE CODE IN THESE CURLY BRACES.
void simulate() {
  KochCurve curve1 = new KochCurve(1400, 50, 600, 60, 4, t);
  LRN lrn1 = new LRN(curve1, t, 10);
  lrn1.displayFancyLRN();
  
  // Now lets create and queue some actions. Actions will be animated and performed in real time. Actions must be queued after they are created.
  // A RightRotationAction rotates the right subframework of the LRN and the analogous is true of the LeftRotationAction.
  //RightRotationAction action1 = new RightRotationAction(false, 100, 30, lrn1, 0.3);
  RightRotationAction action1 = new RightRotationAction(true, 50, 20, lrn1, 0.1);
  queueAction(action1);
  RightRotationAction action2 = new RightRotationAction(100, -20, lrn1, -0.2);
  queueAction(action2);
  LeftRotationAction action3 = new LeftRotationAction(150, 30, lrn1, 0.3);
  queueAction(action3);
  LeftRotationAction action4 = new LeftRotationAction(200, -30, lrn1, -0.4);
  queueAction(action4);
}

/* Example Simulations:
1. Displaying a Koch Curve and overlaying several frameworks:
  // Creates and displayes one instance of the alpha-koch curve. The first argument is the width of the curve. The second and third arguments are the x and y-coordinates of the start point of the curve.
  // The fourth argument is the alpha parameter of the curve and the fifth argument is the degree of the curve. The last argument, t, is just there to assist in the process of drawing the curve.
  KochCurve kochCurve1 = new KochCurve(1400, 50, 725, 15, 6, t);
  kochCurve1.displayArc();
  
  // Creates and displayes more instances of other Koch curves.
  KochCurve kochCurve2 = new KochCurve(650, 50, 300, 30, 6, t);
  //kochCurve2.displayArc();
  KochCurve kochCurve3 = new KochCurve(650, 750, 300, 45, 6, t);
  //kochCurve3.displayArc();
  KochCurve kochCurve4 = new KochCurve(650, 50, 725, 60, 6, t);
  //kochCurve4.displayArc();
  KochCurve kochCurve5 = new KochCurve(650, 750, 725, 75, 6, t);
  //kochCurve5.displayArc();
  
2. Rotating subarcs of the koch cruve:
  KochCurve kochCurve1 = new KochCurve(1400, 50, 400, 60, 3, t);
  kochCurve1.displayArc();
  
  // Rotates everything after the 10th vertex from the left end of the curve 20 degrees clockwise
  kochCurve1.rotateRightSubArc(10, 20);
  kochCurve1.displayArc();
  
  //Performs another rotation
  kochCurve1.rotateRightSubArc(50, 30);
  //kochCurve1.displayArc();
  
  KochCurve kochCurve2 = new KochCurve(1400, 50, 725, 60, 6, t);
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
  RightRegion r1 = new RightRegion(50, 500, 500, 60, 10);
  r1.displayRightRegion();
  
  LeftRegion l1 = new LeftRegion(1200, 100, 350, 45, 5);
  l1.displayLeftRegion();
   
4. Place left and right regions at different orientations and use fancy left and right region displayes:
  // The new argument is the clockwise rotation of the left or right region.
  RightRegion r1 = new RightRegion(150, 450, 400, 60, 10, 2);
  LeftRegion l1 = new LeftRegion(150, 450, 400, 60, 10, 270);
  
  // The fancy draw method draws the regions with color.
  r1.displayFancyRightRegion();
  l1.displayFancyLeftRegion();
  
  // By default, right regions will be in red and left regions will be in blue, but you can use extra arguemnts to change these colors.
  // The last 3 arguments are the RGB values for the color of the region.
  RightRegion r2 = new RightRegion(50, 400, 400, 60, 15, 10, 13, 168, 128);
  //r2.displayFancyRightRegion();
  LeftRegion l2 = new LeftRegion(100, 400, 250, 80, 8, 30, 254, 9, 133);
  //l2.displayFancyLeftRegion();
   
5. You can rotate left and right regions after they have been defined:
  RightRegion r1 = new RightRegion(50, 400, 400, 60, 10, 0);
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
  PolyArc myArc = new PolyArc(myPoints);
  myArc.displayArc();
  
  //Rotating right components of arc. This rotation is done about the second vertex from the left because the vertices are zero indexed.
  myArc.rotateRightSubArc(1, 45);
  //myArc.displayArc();
  
  //Rotating left components of arc. This rotation is done about the fourth vertex from the left because the vertices are zero indexed.
  myArc.rotateLeftSubArc(3, 45);
  //myArc.displayArc();
  
7. Constructors and displaye functions for L-R Pairs 
  // Create and display an LRPairs in all posible ways
  LRPair pair1 = new LRPair(true, true, 75, 300, 400, 300, 15, 30, 3, 67, 24, 102, 55, 221, 174, 42, 1);
  LRPair pair2 = new LRPair(60, 200, 350, 400, 15, 6, 135, 17, 48, 165, 46, 228, 139, 224, 243);
  LRPair pair3 = new LRPair(true, true, 40, 300, 400, 300, 10, 20);
  LRPair pair4 = new LRPair(true, true, 45, 300, 400, 300, 8);
  LRPair pair5 = new LRPair(60, 300, 400, 300, 10, 15);
  LRPair pair6 = new LRPair(80, 300, 400, 300, 20);
  
  // Display all of the pairs using the regular and fancy methods
  pair1.displayPair();
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
  LRPair pair1 = new LRPair(true, true, 75, 300, 400, 300, 15, 30, 3, 67, 24, 102, 55, 221, 174, 42, 1);
  
  // Displaye the pair
  //pair1.displayPair();
  pair1.displayFancyPair();
  
  // Rotate the pair and displaye it again
  pair1.rotatePair(600, 200, 15);
  pair1.displayPair();
  //pair1.displayFancyPair();
  
  // Rotate it using differnt arguments
  pair1.rotatePair(20);
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

9. Creating regions corresponding to a given alpha-Koch Curve
  KochCurve curve1 = new KochCurve(700, 350, 550, 60, 1, t);
  curve1.displayArc();
  
  // Create the circumscribing right region and the corresponding left region
  RightRegion r1 = new RightRegion(curve1, 15);
  LeftRegion l1 = new LeftRegion(curve1, 15);
  //r1.displayRightRegion();
  l1.displayLeftRegion();
  
  // Create the L-R pair corresponding to the curve
  LRPair pair1 = new LRPair(curve1, true, true, 15);
  //pair1.displayPair();
  //pair1.displayFancyPair();
  
10. Applying the 4 phi transformations to left and right regions
  KochCurve curve1 = new KochCurve(700, 350, 400, 60, 1, t);
  curve1.displayArc();
  
  // Create the circumscribing right region and the corresponding left region
  RightRegion r1 = new RightRegion(curve1, 15);
  LeftRegion l1 = new LeftRegion(curve1, 15);
  //r1.displayRightRegion();
  l1.displayLeftRegion();
  
  // Apply the phi maps to the right region
  RightRegion r2 = r1.phi1();
  RightRegion r3 = r1.phi2();
  RightRegion r4 = r1.phi3();
  RightRegion r5 = r1.phi4();
  //r2.displayRightRegion();
  //r3.displayRightRegion();
  //r4.displayRightRegion();
  //r5.displayRightRegion();
  //r2.displayFancyRightRegion();
  //r3.displayFancyRightRegion();
  //r4.displayFancyRightRegion();
  //r5.displayFancyRightRegion();
  
  // Apply the phi maps to the left region
  LeftRegion l2 = l1.phi1();
  LeftRegion l3 = l1.phi2();
  LeftRegion l4 = l1.phi3();
  LeftRegion l5 = l1.phi4();
  l2.displayLeftRegion();
  l3.displayLeftRegion();
  l4.displayLeftRegion();
  l5.displayLeftRegion();
  //l2.displayFancyLeftRegion();
  //l3.displayFancyLeftRegion();
  //l4.displayFancyLeftRegion();
  //l5.displayFancyLeftRegion();
  
  // Repeat but with rotated left and right region
  r1.rotateRightRegion(40);
  l1.rotateLeftRegion(40);
  //r1.displayRightRegion();
  //l1.displayLeftRegion();
  
  RightRegion r6 = r1.phi1();
  RightRegion r7 = r1.phi2();
  RightRegion r8 = r1.phi3();
  RightRegion r9 = r1.phi4();
  //r6.displayRightRegion();
  //r7.displayRightRegion();
  //r8.displayRightRegion();
  //r9.displayRightRegion();
  //r6.displayFancyRightRegion();
  //r7.displayFancyRightRegion();
  //r8.displayFancyRightRegion();
  //r9.displayFancyRightRegion();
  
  LeftRegion l6 = l1.phi1();
  LeftRegion l7 = l1.phi2();
  LeftRegion l8 = l1.phi3();
  LeftRegion l9 = l1.phi4();
  //l6.displayLeftRegion();
  //l7.displayLeftRegion();
  //l8.displayLeftRegion();
  //l9.displayLeftRegion();
  //l6.displayFancyLeftRegion();
  //l7.displayFancyLeftRegion();
  //l8.displayFancyLeftRegion();
  //l9.displayFancyLeftRegion();
  
11. Applying the 4 phi transformations to L-R pairs
  KochCurve curve1 = new KochCurve(700, 350, 400, 60, 1, t);
  curve1.displayArc();
  LRPair pair1 = new LRPair(curve1, true, true, 10);
  pair1.displayPair();
  //pair1.displayFancyPair();
  
  // Apply the 4 phi transformations to the L-R pair
  LRPair pair2 = pair1.phi1();
  LRPair pair3 = pair1.phi2();
  LRPair pair4 = pair1.phi3();
  LRPair pair5 = pair1.phi4();
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
  
  LRPair pair6 = pair1.phi1();
  LRPair pair7 = pair1.phi2();
  LRPair pair8 = pair1.phi3();
  LRPair pair9 = pair1.phi4();
  //pair6.displayPair();
  //pair7.displayPair();
  //pair8.displayPair();
  //pair9.displayPair();
  //pair6.displayFancyPair();
  //pair7.displayFancyPair();
  //pair8.displayFancyPair();
  //pair9.displayFancyPair();
  
12. Making and Displaying LRN's
  // These are some of the constructors for LRNs look at LRN file for more documentation on constructors.
  LRN lrn1 = new LRN(true, true, 1400, 50, 700, 80, 5, t, 10, 186, 83, 49, 27, 99, 13, 174, 85, 227);
  LRN lrn2 = new LRN(1300, 100, 600, 45, 3, t, 10);
  //lrn1.displayLRN();
  //lrn1.displayFancyLRN();
  //lrn2.displayLRN();
  lrn2.displayFancyLRN();
  
  // The right regions in lrn1 cause a lot of self-intersection so lets get a clearer picture by ommiting them.
  lrn1.setShowR(false);
  //lrn1.displayLRN();
  //lrn1.displayFancyLRN();
  // Now lets show, for proof of concept, that we can omit left regions as well.
  lrn1.setShowR(true);
  lrn1.setShowL(false);
  //lrn1.displayLRN();
  //lrn1.displayFancyLRN();
  
  // A more convenient way is to create an LRN based on its associated alpha-Koch curve
  KochCurve curve1 = new KochCurve(1400, 50, 700, 60, 4, t);
  LRN lrn3 = new LRN(curve1, t, 10);
  //lrn3.displayLRN();
  //lrn3.displayFancyLRN();
  
13. Rotating sub-frameworks of LRN's
  KochCurve curve1 = new KochCurve(1400, 50, 700, 60, 4, t);
  LRN lrn3 = new LRN(curve1, t, 10);
  //lrn3.displayLRN();
  lrn3.displayFancyLRN();
  
  // Rotate parts of the LRN
  lrn3.rotateLeftSubFrame(20, 40);
  lrn3.displayFancyLRN();
  lrn3.rotateRightSubFrame(55, 50);
  //lrn3.displayFancyLRN();
  
14. Using the rotation actions
  KochCurve curve1 = new KochCurve(1400, 50, 600, 60, 4, t);
  LRN lrn1 = new LRN(curve1, t, 10);
  lrn1.displayFancyLRN();
  
  // Now lets create and queue some actions. Actions will be animated and performed in real time. Actions must be queued after they are created.
  // A RightRotationAction rotates the right subframework of the LRN and the analogous is true of the LeftRotationAction.
  //RightRotationAction action1 = new RightRotationAction(false, 100, 30, lrn1, 0.3);
  RightRotationAction action1 = new RightRotationAction(true, 50, 20, lrn1, 0.1);
  queueAction(action1);
  RightRotationAction action2 = new RightRotationAction(100, -20, lrn1, -0.2);
  queueAction(action2);
  LeftRotationAction action3 = new LeftRotationAction(150, 30, lrn1, 0.3);
  queueAction(action3);
  LeftRotationAction action4 = new LeftRotationAction(200, -30, lrn1, -0.4);
  queueAction(action4);
*/

void setup(){
  size(1500, 800);
  background(255);
  t = new TurtleDrawer(0, 0);
  simulate();
}

void draw() {
  if (currentActionIndex < actionQueue.size()) {
    Action current = actionQueue.get(currentActionIndex);
    if (!current.perform()) {
      currentActionIndex++;
    }
  }
}

/*
Inputs:
  action - The action which is to be performed by the program
Action: Adds the given action to the queue of actions
*/
void queueAction(Action action) {
  actionQueue.add(action);
}

/*
void keyPressed() {
  if (keyCode == LEFT) {
    rotationSpeed = -0.1;
  }
  else if (keyCode == RIGHT) {
    rotationSpeed = 0.5;
  }
  else if (keyCode == ' ') {
    rotationSpeed = 0;
  }
}

void keyReleased() {
  if (keyCode == LEFT || keyCode == RIGHT || keyCode == ' ') {
    rotationSpeed = 0.1;
  }
}
*/
