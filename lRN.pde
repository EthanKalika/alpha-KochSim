/*
Author: Ethan Kalika
Date: June 20, 2025
*/

class LRN {
  /*
  showL - Boolean representing whether to show the left regions or not
  showR - Boolean representing whether to show the right regions or not
  regions - An ArrayList that contains all the regions associated with the LRN
  alphaKoch - The alpha-Koch curve associated with the LRN
  */
  boolean showL, showR;
  ArrayList<LRPair> regions;
  KochCurve alphaKoch;
  
  /*
  Inputs:
    l - A boolean representing weather to show the left regions or not
    r - A boolean representing weather to show the right regions or not
    wOC - The width of the configuration in pixels
    x - The x-coordinate of the position of the left most point of the configuration
    y - The y-coordinate of the position of the left most point of the configuration
    alpha - The alpha parameter of the associated alpha-Koch Curve
    level - The degree of the associated alpha-Koch Curve
    turtle - The turtleDrawer that helps draw the associated alpha-Koch Cruve
    beta - The buffer region for the left and right regions
    col1 - The R value of the RGB value of the color of the left regions
    col2 - The G value of the RGB value of the color of the left regions
    col3 - The B value of the RGB value of the color of the left regions
    col4 - The R value of the RGB value of the color of the intersection regions
    col5 - The G value of the RGB value of the color of the intersection regions
    col6 - The B value of the RGB value of the color of the intersection regions
    col7 - The R value of the RGB value of the color of the right regions
    col8 - The G value of the RGB value of the color of the right regions
    col9 - The B value of the RGB value of the color of the right regions
  Action: Creates an LRN with the desired parameters
  */
  LRN(boolean l, boolean r, float wOC, float x, float y, int alpha, int level, TurtleDrawer turtle, float beta, int col1, int col2, int col3, int col4, int col5, int col6, int col7, int col8, int col9) {
    showL = l;
    showR = r;
    alphaKoch = new KochCurve(wOC, x, y, alpha, level, turtle);
    LRPair rootPair = new LRPair(alphaKoch, l, r, beta, col1, col2, col3, col4, col5, col6, col7, col8, col9);
    regions = new ArrayList<LRPair>();
    calcRegions(level, rootPair, regions);
  }
  
  /*
  Inputs:
    wOC - The width of the configuration in pixels
    x - The x-coordinate of the position of the left most point of the configuration
    y - The y-coordinate of the position of the left most point of the configuration
    alpha - The alpha parameter of the associated alpha-Koch Curve
    level - The degree of the associated alpha-Koch Curve
    turtle - The turtleDrawer that helps draw the associated alpha-Koch Cruve
    beta - The buffer region for the left and right regions
    col1 - The R value of the RGB value of the color of the left regions
    col2 - The G value of the RGB value of the color of the left regions
    col3 - The B value of the RGB value of the color of the left regions
    col4 - The R value of the RGB value of the color of the intersection regions
    col5 - The G value of the RGB value of the color of the intersection regions
    col6 - The B value of the RGB value of the color of the intersection regions
    col7 - The R value of the RGB value of the color of the right regions
    col8 - The G value of the RGB value of the color of the right regions
    col9 - The B value of the RGB value of the color of the right regions
  Action: Creates an LRN with the desired parameters. By default both the left and right regions are shown.
  */
  LRN(float wOC, float x, float y, int alpha, int level, TurtleDrawer turtle, float beta, int col1, int col2, int col3, int col4, int col5, int col6, int col7, int col8, int col9) {
    this(true, true, wOC, x, y, alpha, level, turtle, beta, col1, col2, col3, col4, col5, col6, col7, col8, col9);
  }
  
  /*
  Inputs:
    l - A boolean representing weather to show the left regions or not
    r - A boolean representing weather to show the right regions or not
    wOC - The width of the configuration in pixels
    x - The x-coordinate of the position of the left most point of the configuration
    y - The y-coordinate of the position of the left most point of the configuration
    alpha - The alpha parameter of the associated alpha-Koch Curve
    level - The degree of the associated alpha-Koch Curve
    turtle - The turtleDrawer that helps draw the associated alpha-Koch Cruve
    beta - The buffer region for the left and right regions
  Action: Creates an LRN with the desired parameters. By defualt the left regions are blue, right regions are red, and the intersections are purple.
  */
  LRN(boolean l, boolean r, float wOC, float x, float y, int alpha, int level, TurtleDrawer turtle, float beta) {
    this(l, r, wOC, x, y, alpha, level, turtle, beta, 0, 0, 255, 128, 0, 128, 255, 0, 0);
  }
  
  /*
  Inputs:
    wOC - The width of the configuration in pixels
    x - The x-coordinate of the position of the left most point of the configuration
    y - The y-coordinate of the position of the left most point of the configuration
    alpha - The alpha parameter of the associated alpha-Koch Curve
    level - The degree of the associated alpha-Koch Curve
    turtle - The turtleDrawer that helps draw the associated alpha-Koch Cruve
    beta - The buffer region for the left and right regions
  Action: Creates an LRN with the desired parameters. By defualt the left regions are blue, right regions are red, and the intersections are purple. By default both the left and right regions are shown.
  */
  LRN(float wOC, float x, float y, int alpha, int level, TurtleDrawer turtle, float beta) {
    this(true, true, wOC, x, y, alpha, level, turtle, beta, 0, 0, 255, 128, 0, 128, 255, 0, 0);
  }
  
  /*
  Inputs:
    l - A boolean representing weather to show the left regions or not
    r - A boolean representing weather to show the right regions or not
    turtle - The turtleDrawer that helps draw the associated alpha-Koch Cruve
    beta - The buffer region for the left and right regions
    col1 - The R value of the RGB value of the color of the left regions
    col2 - The G value of the RGB value of the color of the left regions
    col3 - The B value of the RGB value of the color of the left regions
    col4 - The R value of the RGB value of the color of the intersection regions
    col5 - The G value of the RGB value of the color of the intersection regions
    col6 - The B value of the RGB value of the color of the intersection regions
    col7 - The R value of the RGB value of the color of the right regions
    col8 - The G value of the RGB value of the color of the right regions
    col9 - The B value of the RGB value of the color of the right regions
  Action: Creates an LRN associated the given alpha-Koch Curve. 
  */
  LRN(KochCurve curve, TurtleDrawer turtle, boolean l, boolean r, float beta, int col1, int col2, int col3, int col4, int col5, int col6, int col7, int col8, int col9) {
    this(l, r, curve.getWidthOfCurve(), curve.getXPos(), curve.getYPos(), curve.getAlpha(), curve.getLevel(), turtle, beta, col1, col2, col3, col4, col5, col6, col7, col8, col9);
  }
  
  /*
  Inputs:
    l - A boolean representing weather to show the left regions or not
    r - A boolean representing weather to show the right regions or not
    turtle - The turtleDrawer that helps draw the associated alpha-Koch Cruve
    beta - The buffer region for the left and right regions
  Action: Creates an LRN associated the given alpha-Koch Curve. By defualt the left regions are blue, right regions are red, and the intersections are purple.
  */
  LRN(KochCurve curve, TurtleDrawer turtle, boolean l, boolean r, float beta) {
    this(l, r, curve.getWidthOfCurve(), curve.getXPos(), curve.getYPos(), curve.getAlpha(), curve.getLevel(), turtle, beta, 0, 0, 255, 128, 0, 128, 255, 0, 0);
  }
  
  /*
  Inputs:
    turtle - The turtleDrawer that helps draw the associated alpha-Koch Cruve
    beta - The buffer region for the left and right regions
  Action: Creates an LRN associated the given alpha-Koch Curve. By defualt the left regions are blue, right regions are red, and the intersections are purple. By default both the left and right regions
  are shown.
  */
  LRN(KochCurve curve, TurtleDrawer turtle, float beta) {
    this(true, true, curve.getWidthOfCurve(), curve.getXPos(), curve.getYPos(), curve.getAlpha(), curve.getLevel(), turtle, beta, 0, 0, 255, 128, 0, 128, 255, 0, 0);
  }
  
  /*
  Inputs:
    level - The degree of the associated alpha-Koch Curve
    pair - An lRPair circumscribed about the given alpha-Koch curve
    pairList - A list used to store the calculated lRPairs
  Action: This is a helper method used to calcualte the left and right regions in the LRN and store them in an ArrayList.
  */
  private void calcRegions(int level,  LRPair pair, ArrayList<LRPair> pairList) {
    if(level == 0) {
      pairList.add(pair);
    }
    else {
      calcRegions(level - 1, pair.phi1(), pairList);
      calcRegions(level - 1, pair.phi2(), pairList);
      calcRegions(level - 1, pair.phi3(), pairList);
      calcRegions(level - 1, pair.phi4(), pairList);
    }
  }
  
  /*
  Action: This displays the LRN without the assigned colors.
  */
  void displayLRN() {
     for(LRPair i : regions) {
       i.displayPair();
      }
     alphaKoch.displayArc();
  }
  
  /*
  Action: This displays the LRN with the assigned colors.
  */
  void displayFancyLRN() {
    for(LRPair i : regions) {
      i.displayFancyPair();
    }
    alphaKoch.displayArc();
  }
  
  /*
  Inputs:
    endVert - The numerical representation of the vertex of the associated alpha-Koch curve about which the sub-configuration to the left of the vertex should be rotated
    deg - The amount of degrees by which to rotate
  Action: Rotates all parts of the configuration to the left of the given vertex deg degrees clockwise about the given vertex.
  */
  void rotateLeftSubFrame(int endVert, float deg) {
    alphaKoch.rotateLeftSubArc(endVert, deg);
    PVector rotationCenter = alphaKoch.getArc().getPoints().get(endVert);
    for (int i = 0; i < endVert; i++) {
      regions.get(i).rotatePair(rotationCenter.x, rotationCenter.y, deg);
    }
  }
  
  /*
  Inputs:
    endVert - The base 4 representation of the vertex of the associated alpha-Koch curve about which the sub-configuration to the left of the vertex should be rotated
    deg - The amount of degrees by which to rotate
  Action: Rotates all parts of the configuration to the left of the given vertex deg degrees clockwise about the given vertex.
  */
  void rotateLeftSubFrame(String endVert, float deg) {
    rotateLeftSubFrame(angleIDWrapper(endVert), deg);
  }
  
  /*
  Inputs:
    startVert - The numerical representation of the vertex of the associated alpha-Koch curve about which the sub-configuration to the right of the vertex should be rotated
    deg - The amount of degrees by which to rotate
  Action: Rotates all parts of the configuration to the right of the given vertex deg degrees clockwise about the given vertex.
  */
  void rotateRightSubFrame(int startVert, float deg) {
    alphaKoch.rotateRightSubArc(startVert, deg);
    PVector rotationCenter = alphaKoch.getArc().getPoints().get(startVert);
    for (int i = startVert; i < regions.size(); i++) {
      regions.get(i).rotatePair(rotationCenter.x, rotationCenter.y, deg);
    }
  }
  
  /*
  Inputs:
    startVert - The base 4 representation of the vertex of the associated alpha-Koch curve about which the sub-configuration to the right of the vertex should be rotated
    deg - The amount of degrees by which to rotate
  Action: Rotates all parts of the configuration to the right of the given vertex deg degrees clockwise about the given vertex.
  */
  void rotateRightSubFrame(String startVert, float deg) {
    rotateRightSubFrame(angleIDWrapper(startVert), deg);
  }
  
  KochCurve getKochCurve() {
    return alphaKoch;
  }
  
  /*
  Inputs:
    givenL - The value to which the showL value should be set set
  Action: Sets the showL value to givenL
  */
  void setShowL(boolean givenL) {
    showL = givenL;
    for (LRPair i : regions) {
      i.setL(givenL);
    }
  }
  
  /*
  Inputs:
    givenR - The value to which the showR value should be set set
  Action: Sets the showL value to givenR
  */
  void setShowR(boolean givenR) {
    showR = givenR;
    for (LRPair i : regions) {
      i.setR(givenR);
    }
  }
}
