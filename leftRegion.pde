/*
Author: Ethan Kalika
Date: Jun 15, 2025
*/

class leftRegion {
  /*
  x - The x-coordinate of the leftmost point of the curve
  y - The y-coordinate of the leftmost point of the curve
  l - The width of the right region
  alpha - The alpha parameter of the curve (given in degrees)
  beta - The angle used to create the buffer region (given in degrees)
  orient - The orientation of the right region (How far its been rotated from a horizontal orientation in degrees)
  p1 - The position of the left most point
  p2 - The position of the top point
  p3 - The position of the right point
  p4 - The position of the bottom point
  */
  float x, y, l, alpha, beta, orient;
  PVector p1, p2, p3, p4;
  int[] col;
  
  leftRegion(float givenX, float givenY, float givenL, float givenAlpha, float givenBeta, float givenOrient, int givenR, int givenG, int givenB) {
    x = givenX;
    y = givenY;
    l = givenL;
    alpha = givenAlpha;
    beta = givenBeta;
    orient = givenOrient;
    PVector displacementVec = new PVector(x, y);
    p1 = new PVector(0, 0);
    p2 = new PVector(l / 2, l * sin(radians(alpha)));
    p3 = new PVector(l, 0);
    p4 = new PVector(l / 2, - l / 2 * tan(radians(beta)));
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
  
  leftRegion(float givenX, float givenY, float givenL, float givenAlpha, float givenBeta, float givenOrient) {
    this(givenX, givenY, givenL, givenAlpha, givenBeta, givenOrient, 0, 0, 255);
  }
  
  leftRegion(float givenX, float givenY, float givenL, float givenAlpha, float givenBeta) {
    this(givenX, givenY, givenL, givenAlpha, givenBeta, 0);
  }
  
  /*
  Action: Draws the left region
  */
  void drawLeftRegion(){
    line(p1.x, p1.y, p2.x, p2.y);
    line(p2.x, p2.y, p3.x, p3.y);
    line(p3.x, p3.y, p4.x, p4.y);
    line(p4.x, p4.y, p1.x, p1.y);
  }
  
  /*
  Action: Draws the left region with the desired color
  */
  void drawFancyLeftRegion() {
    drawLeftRegion();
    fill(col[0], col[1], col[2]);
    beginShape();
    vertex(p1.x, p1.y);
    vertex(p2.x, p2.y);
    vertex(p3.x, p3.y);
    vertex(p4.x, p4.y);
    endShape(CLOSE);
  }
  
  void rotateLeftRegion(float deg) {
    PVector displacementVec = new PVector(x, y);
    orient += deg;
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
  }
}
