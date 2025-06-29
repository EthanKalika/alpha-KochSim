/*
Author: Ethan Kalika
Date: May 22, 2025
*/

class rightRegion {
  /*
  x - The x-coordinate of the leftmost point of the curve
  y - The y-coordinate of the leftmost point of the curve
  l - The width of the right region
  alpha - The alpha parameter of the curve (given in degrees)
  beta - The angle used to create the buffer region (given in degrees)
  orient - The orientation of the right region (How far its been rotated from a horizontal orientation in degrees)
  l - The length of a single edge in the inscribed curve
  p1 - The position of the left most point
  p2 - The position of the top point
  p3 - The position of the right point
  p4 - The position of the bottom point
  col - Stores the color of the right region as an RGB value (array of 3 integers)
  */
  int alpha;
  float x, y, w, beta, orient, l;
  PVector p1, p2, p3, p4;
  int[] col;
  
  /*
  Inputs:
    givenX - The x-coordinate of the left most point of the right region
    givenY - The y-coordinate of the left most point of the right region
    givenL - The width of the inscribed alpha-Koch curve
    givenAlpha - The alpha parameter of the inscribed alpha-Koch curve
    givenBeta - The angle for the buffer region
    givenOrient - The initial orientation of the right region
    givenR - The R value of the RGB representation of the color of the right region
    givenG - The G value of the RGB representation of the color of the right region
    givenB - The B value of the RGB representation of the color of the right region
  Action: Creates an instance of a left region with the desired parameters
  */
  rightRegion(float givenX, float givenY, float givenL, int givenAlpha, float givenBeta, float givenOrient, int givenR, int givenG, int givenB) {
    x = givenX;
    y = givenY;
    w = givenL;
    alpha = givenAlpha;
    beta = givenBeta;
    orient = givenOrient;
    l = w / (2 + 2 * cos(radians(alpha)));
    PVector displacementVec = new PVector(x, y);
    p1 = new PVector(0, 0);
    p2 = new PVector(w / 2, - l * sin(radians(alpha)));
    p3 = new PVector(w, 0);
    p4 = new PVector(w / 2, w / 2 * tan(radians(beta)));
    p1.rotate(radians(orient));
    p2.rotate(radians(orient));
    p3.rotate(radians(orient));
    p4.rotate(radians(orient));
    p1.add(displacementVec);
    p2.add(displacementVec);
    p3.add(displacementVec);
    p4.add(displacementVec);
    col = new int[3];
    col[0] = givenR;
    col[1] = givenG;
    col[2] = givenB;
  }
  
  /*
  Inputs:
    givenX - The x-coordinate of the left most point of the right region
    givenY - The y-coordinate of the left most point of the right region
    givenL - The width of the inscribed alpha-Koch curve
    givenAlpha - The alpha parameter of the inscribed alpha-Koch curve
    givenBeta - The angle for the buffer region
    givenOrient - The initial orientation of the right region
  Action: Creates an instance of a left region with the desired parameters. The color is set to red by default.
  */
  rightRegion(float givenX, float givenY, float givenL, int givenAlpha, float givenBeta, float givenOrient) {
    this(givenX, givenY, givenL, givenAlpha, givenBeta, givenOrient, 255, 0, 0);
  }
  
  /*
  Inputs:
    givenX - The x-coordinate of the left most point of the right region
    givenY - The y-coordinate of the left most point of the right region
    givenL - The width of the inscribed alpha-Koch curve
    givenAlpha - The alpha parameter of the inscribed alpha-Koch curve
    givenBeta - The angle for the buffer region
  Action: Creates an instance of a left region with the desired parameters. The color is set to red by default. The orientation is set to 0 by default.
  */
  rightRegion(float givenX, float givenY, float givenL, int givenAlpha, float givenBeta) {
    this(givenX, givenY, givenL, givenAlpha, givenBeta, 0);
  }
  
  /*
  Inputs:
    curve - A pre-existing alpha-Koch Curve
    givenBeta - The angle for the buffer region
  Action: Creates an instance of a right region with the desired parameters. The color is set to red by default. The orientation is set to 0 by default. The right region is set to be circumscribed about
  the given curve.
  */
  rightRegion(kochCurve curve, float givenBeta) {
    this(curve.getXPos(), curve.getYPos(), curve.getWidthOfCurve(), curve.getAlpha(), givenBeta, 0);
  }
  
  /*
  Action: Draws the right region
  */
  void displayRightRegion() {
    line(p1.x, p1.y, p2.x, p2.y);
    line(p2.x, p2.y, p3.x, p3.y);
    line(p3.x, p3.y, p4.x, p4.y);
    line(p4.x, p4.y, p1.x, p1.y);
  }
  
  /*
  Action: Draws the right region with the desired color
  */
  void displayFancyRightRegion() {
    displayRightRegion();
    fill(col[0], col[1], col[2]);
    beginShape();
    vertex(p1.x, p1.y);
    vertex(p2.x, p2.y);
    vertex(p3.x, p3.y);
    vertex(p4.x, p4.y);
    endShape(CLOSE);
  }
  
  /*
  Inputs:
    givenX - The x-coordinate of the center
    givenY - The y-coordinate of the center
    deg - The number of degrees by which to rotate the right region
  Action: Rotates the right region clockwise by the indicated number of degrees about the indicated center
  */
  void rotateRightRegion(float givenX, float givenY, float deg) {
    orient += deg;
    PVector displacementVec = new PVector(givenX, givenY);
    p1.sub(displacementVec);
    p2.sub(displacementVec);
    p3.sub(displacementVec);
    p4.sub(displacementVec);
    p1.rotate(radians(deg));
    p2.rotate(radians(deg));
    p3.rotate(radians(deg));
    p4.rotate(radians(deg));
    p1.add(displacementVec);
    p2.add(displacementVec);
    p3.add(displacementVec);
    p4.add(displacementVec);
    x = p1.x;
    y = p1.y;
  }
  
  /*
  Input:
    deg - A float representing the number of degrees by which to rotate the right region
  Action: Rotates the right region clockwise by the indicated number of degrees about p1
  */
  void rotateRightRegion(float deg) {
    rotateRightRegion(x, y, deg);
  }
  
  /*
  Action: Copies the right region and applys the phi_1 transformation to it
  */
  rightRegion phi1() {
    return new rightRegion(x, y, l, alpha, beta, orient, col[0], col[1], col[2]);
  }
  
  /*
  Action: Copies the right region and applys the phi_2 transformation to it
  */
  rightRegion phi2() {
    return new rightRegion(x + l * cos(radians(orient)), y + l * sin(radians(orient)), l, alpha, beta, orient - alpha, col[0], col[1], col[2]);
  }
  
  /*
  Action: Copies the right region and applys the phi_3 transformation to it
  */
  rightRegion phi3() {
    return new rightRegion(x + l * cos(radians(orient)) + l * cos(radians(orient - alpha)), y + l * sin(radians(orient)) + l * sin(radians(orient - alpha)), l, alpha, beta, orient + alpha, col[0], col[1], col[2]);
  }
  
  /*
  Action: Copies the right region and applys the phi_4 transformation to it
  */
  rightRegion phi4() {
    return new rightRegion(x + l * (1 + 2 * cos(radians(alpha))) * cos(radians(orient)), y + l * (1 + 2 * cos(radians(alpha))) * sin(radians(orient)), l, alpha, beta, orient, col[0], col[1], col[2]);
  }
  
  PVector getP1() {
    return p1;
  }
  
  PVector getP2() {
    return p2;
  }
  
  PVector getP3() {
    return p3;
  }
  
  PVector getP4() {
    return p4;
  }
  
  int getAlpha() {
    return alpha;
  }
  
  float getX() {
    return x;
  }
  
  float getY() {
    return y;
  }
  
  float getW() {
    return w;
  }
  
  float getBeta() {
    return beta;
  }
  
  float getOrient() {
    return orient;
  }
  
  float getL() {
    return l;
  }
  
  int[] getCol() {
    return col;
  }
}
