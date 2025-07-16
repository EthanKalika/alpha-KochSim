/*
Author: Ethan Kalika
Date: June 20, 2025
*/

class LRPair {
  /*
  showL - A boolean stating weather to show the left region
  showR - A boolean stating weather to show the right region
  col - An array storing 3 values representing the RGB value of the color of the intersection of the left and right region
  l - The left region associated with the pair
  r - The right region associated with the pair
  */
  boolean showL, showR;
  int[] col;
  LeftRegion left;
  RightRegion right;
  
  /*
  Inputs:
    givenShowL - A boolean stating weather the left region is to be displayed
    givenShowR - A boolean stating weather the right region is to be shown
    alpha - The alpha parameter of the inscribed alpha-Koch Curve
    x - The x-coordinate of the p1 points of the associated left and right regions
    y - The y-coordinate of the p1 points of the associated left and right regions
    w - The width of the inscribed alpha-Koch Curve
    beta - The angle parameter of the buffer region
    orient - The angle of the starting orientations of the associated left and right regions
    col1 - The R value in the RGB value of the color of the associated left region
    col2 - The G value in the RGB value of the color of the associated left region
    col3 - The B value in the RGB value of the color of the associated left region
    col4 - The R value in the RGB value of the color of the associated center region
    col5 - The G value in the RGB value of the color of the associated center region
    col6 - The B value in the RGB value of the color of the associated center region
    col7 - The R value in the RGB value of the color of the associated right region
    col8 - The G value in the RGB value of the color of the associated right region
    col9 - The B value in the RGB value of the color of the associated right region
  Action: Creates and instance of an lRPair with the desired parameters
  */
  LRPair(boolean givenShowL, boolean givenShowR, int alpha, float x, float y, float w, float beta, float orient, int col1, int col2, int col3, int col4, int col5, int col6, int col7, int col8, int col9) {
    showL = givenShowL;
    showR = givenShowR;
    col = new int[]{col4, col5, col6};
    left = new LeftRegion(x, y, w, alpha, beta, orient, col1, col2, col3);
    right = new RightRegion(x, y, w, alpha, beta, orient, col7, col8, col9);
  }
  
  /*
  Inputs:
    alpha - The alpha parameter of the inscribed alpha-Koch Curve
    x - The x-coordinate of the p1 points of the associated left and right regions
    y - The y-coordinate of the p1 points of the associated left and right regions
    w - The width of the inscribed alpha-Koch Curve
    beta - The angle parameter of the buffer region
    orient - The angle of the starting orientations of the associated left and right regions
    col1 - The R value in the RGB value of the color of the associated left region
    col2 - The G value in the RGB value of the color of the associated left region
    col3 - The B value in the RGB value of the color of the associated left region
    col4 - The R value in the RGB value of the color of the associated center region
    col5 - The G value in the RGB value of the color of the associated center region
    col6 - The B value in the RGB value of the color of the associated center region
    col7 - The R value in the RGB value of the color of the associated right region
    col8 - The G value in the RGB value of the color of the associated right region
    col9 - The B value in the RGB value of the color of the associated right region
  Action: Creates and instance of an lRPair with the desired parameters. Both of the regions are shown by default.
  */
  LRPair(int alpha, float x, float y, float w, float beta, float orient, int col1, int col2, int col3, int col4, int col5, int col6, int col7, int col8, int col9) {
    this(true, true, alpha, x, y, w, beta, orient, col1, col2, col3, col4, col5, col6, col7, col8, col9);
  }
  
  /*
  Inputs:
    givenShowL - A boolean stating weather the left region is to be displayed
    givenShowR - A boolean stating weather the right region is to be shown
    alpha - The alpha parameter of the inscribed alpha-Koch Curve
    x - The x-coordinate of the p1 points of the associated left and right regions
    y - The y-coordinate of the p1 points of the associated left and right regions
    w - The width of the inscribed alpha-Koch Curve
    beta - The angle parameter of the buffer region
    orient - The angle of the starting orientations of the associated left and right regions
  Action: Creates and instance of an lRPair with the desired parameters. The color of the left region is set to blue by default, the color of the right region to red, and the center to purple.
  */
  LRPair(boolean givenShowL, boolean givenShowR, int alpha, float x, float y, float w, float beta, float orient) {
    this(givenShowL, givenShowR, alpha, x, y, w, beta, orient, 0, 0, 255, 128, 0, 128, 255, 0, 0);
  }
  
  /*
  Inputs:
    givenShowL - A boolean stating weather the left region is to be displayed
    givenShowR - A boolean stating weather the right region is to be shown
    alpha - The alpha parameter of the inscribed alpha-Koch Curve
    x - The x-coordinate of the p1 points of the associated left and right regions
    y - The y-coordinate of the p1 points of the associated left and right regions
    w - The width of the inscribed alpha-Koch Curve
    beta - The angle parameter of the buffer region
  Action: Creates and instance of an lRPair with the desired parameters. The color of the left region is set to blue by default, the color of the right region to red, and the center to purple. The
  orientation is set to 0 degrees by default.
  */
  LRPair(boolean givenShowL, boolean givenShowR, int alpha, float x, float y, float w, float beta) {
    this(givenShowL, givenShowR, alpha, x, y, w, beta, 0, 0, 0, 255, 128, 0, 128, 255, 0, 0);
  }
  
  /*
  Inputs:
    alpha - The alpha parameter of the inscribed alpha-Koch Curve
    x - The x-coordinate of the p1 points of the associated left and right regions
    y - The y-coordinate of the p1 points of the associated left and right regions
    w - The width of the inscribed alpha-Koch Curve
    beta - The angle parameter of the buffer region
    orient - The angle of the starting orientations of the associated left and right regions
  Action: Creates and instance of an lRPair with the desired parameters. The color of the left region is set to blue by default, the color of the right region to red, and the center to purple. Both of the
  regions are displayed by default.
  */
  LRPair(int alpha, float x, float y, float w, float beta, float orient) {
    this(true, true, alpha, x, y, w, beta, orient, 0, 0, 255, 128, 0, 128, 255, 0, 0);
  }
  
  /*
  Inputs:
    alpha - The alpha parameter of the inscribed alpha-Koch Curve
    x - The x-coordinate of the p1 points of the associated left and right regions
    y - The y-coordinate of the p1 points of the associated left and right regions
    w - The width of the inscribed alpha-Koch Curve
    beta - The angle parameter of the buffer region
  Action: Creates and instance of an lRPair with the desired parameters. The color of the left region is set to blue by default, the color of the right region to red, and the center to purple. Both of the
  regions are displayed by default. The orientation is set to 0 by default.
  */
  LRPair(int alpha, float x, float y, float w, float beta) {
    this(true, true, alpha, x, y, w, beta, 0, 0, 0, 255, 128, 0, 128, 255, 0, 0);
  }
  
  /*
  Inputs:
    curve - The alph-Koch Curve you want the L-R pair to correspond to
    givenShowL - A boolean stating weather the left region is to be displayed
    givenShowR - A boolean stating weather the right region is to be shown
    beta - The angle parameter of the buffer region
    col1 - The R value in the RGB value of the color of the associated left region
    col2 - The G value in the RGB value of the color of the associated left region
    col3 - The B value in the RGB value of the color of the associated left region
    col4 - The R value in the RGB value of the color of the associated center region
    col5 - The G value in the RGB value of the color of the associated center region
    col6 - The B value in the RGB value of the color of the associated center region
    col7 - The R value in the RGB value of the color of the associated right region
    col8 - The G value in the RGB value of the color of the associated right region
    col9 - The B value in the RGB value of the color of the associated right region
  Action: Creates and instance of an lRPair with the right region circumscribed around the given curve
  */
  LRPair(KochCurve curve, boolean givenShowL, boolean givenShowR, float beta, int col1, int col2, int col3, int col4, int col5, int col6, int col7, int col8, int col9) {
    this(givenShowL, givenShowR, curve.getAlpha(), curve.getXPos(), curve.getYPos(), curve.getWidthOfCurve(), beta, 0, col1, col2, col3, col4, col5, col6, col7, col8, col9);
  }
  
  /*
  Inputs:
    curve - The alph-Koch Curve you want the L-R pair to correspond to
    givenShowL - A boolean stating weather the left region is to be displayed
    givenShowR - A boolean stating weather the right region is to be shown
    beta - The angle parameter of the buffer region
  Action: Creates and instance of an lRPair with the right region circumscribed around the given curve
  */
  LRPair(KochCurve curve, boolean givenShowL, boolean givenShowR, float beta) {
    this(givenShowL, givenShowR, curve.getAlpha(), curve.getXPos(), curve.getYPos(), curve.getWidthOfCurve(), beta, 0, 0, 0, 255, 128, 0, 128, 255, 0, 0);
  }
  
  /*
  Action: Displays the intersection of the left and right region without color
  */
  void displayIntersection() {
    line(right.getP1().x, right.getP1().y, left.getP4().x, left.getP4().y);
    line(left.getP4().x, left.getP4().y, right.getP3().x, right.getP3().y);
    line(right.getP3().x, right.getP3().y, right.getP4().x, right.getP4().y);
    line(right.getP4().x, right.getP4().y, right.getP1().x, right.getP1().y);
  }
  
  /*
  Action: Displayes the intersection of the left and right region with color
  */
  void displayFancyIntersection() {
    if (showL) {
      left.displayLeftRegion();
    }
    if (showR) {
      right.displayRightRegion();
    }
    if (showL && showR) {
      displayIntersection();
      fill(col[0], col[1], col[2]);
      beginShape();
      vertex(right.getP1().x, right.getP1().y);
      vertex(left.getP4().x, left.getP4().y);
      vertex(right.getP3().x, right.getP3().y);
      vertex(right.getP4().x, right.getP4().y);
      endShape(CLOSE);
    }
  }
  
  /*
  Action: Displays the left region and right region without color
  */
  void displayPair() {
    if (showL) {
      left.displayLeftRegion();
    }
    if (showR) {
      right.displayRightRegion();
    }
  }
  
  /*
  Action: Displays the left and right region with color and their intersection with color. By default the color the same as for left and right regions and their intersection is purple.
  */
  void displayFancyPair() {
    if (showL) {
      left.displayFancyLeftRegion();
    }
    if (showR) {
      right.displayFancyRightRegion();
    }
    if (showR && showL) {
      displayFancyIntersection();
    }
  }
  
  /*
  Inputs:
    centerX - The x-coordinate of the center of rotation
    centerY - The y-coordinate of the center of rotation
    deg - The number of degrees by which to rotate
  Action: Rotates the left and right regions by the desired number of degrees clockwise about the given center
  */
  void rotatePair(float centerX, float centerY, float deg) {
    left.rotateLeftRegion(centerX, centerY, deg);
    right.rotateRightRegion(centerX, centerY, deg);
  }
  
  /*
  Input:
    deg - The number of degrees by which to rotate the left and right region
  Action: Rotates the left and right region by the desired number of degrees clockwise about p1 of the right region
  */
  void rotatePair(float deg) {
    rotatePair(right.getP1().x, right.getP1().y, deg);
  }
  
  /*
  Action: Copies the L-R pair and applys the phi_1 transformation to it
  */
  LRPair phi1() {
    return new LRPair(showL, showR, right.getAlpha(), right.getX(), right.getY(), right.getL(), right.getBeta(), right.getOrient(), left.getCol()[0], left.getCol()[1], left.getCol()[2], col[0], col[1], col[2], right.getCol()[0], right.getCol()[1], right.getCol()[2]);
  }
  
  /*
  Action: Copies the L-R pair and applys the phi_2 transformation to it
  */
  LRPair phi2() {
    return new LRPair(showL, showR, right.getAlpha(), right.getX() + right.getL() * cos(radians(right.getOrient())), right.getY() + right.getL() * sin(radians(right.getOrient())), right.getL(), right.getBeta(), right.getOrient() - right.getAlpha(), left.getCol()[0], left.getCol()[1], left.getCol()[2], col[0], col[1], col[2], right.getCol()[0], right.getCol()[1], right.getCol()[2]);
  }
  
  /*
  Action: Copies the L-R pair and applys the phi_3 transformation to it
  */
  LRPair phi3() {
    return new LRPair(showL, showR, right.getAlpha(), right.getX() + right.getL() * (cos(radians(right.getOrient())) + cos(radians(right.getOrient() - right.getAlpha()))), right.getY() + right.getL() * (sin(radians(right.getOrient())) + sin(radians(right.getOrient() - right.getAlpha()))), right.getL(), right.getBeta(), right.getOrient() + right.getAlpha(), left.getCol()[0], left.getCol()[1], left.getCol()[2], col[0], col[1], col[2], right.getCol()[0], right.getCol()[1], right.getCol()[2]);
  }
  
  /*
  Action: Copies the L-R pair and applys the phi_4 transformation to it
  */
  LRPair phi4() {
    return new LRPair(showL, showR, right.getAlpha(), right.getX() + right.getL() * (1 + 2 * cos(radians(right.getAlpha()))) * cos(radians(right.getOrient())), right.getY() + right.getL() * (1 + 2 * cos(radians(right.getAlpha()))) * sin(radians(right.getOrient())), right.getL(), right.getBeta(), right.getOrient(), left.getCol()[0], left.getCol()[1], left.getCol()[2], col[0], col[1], col[2], right.getCol()[0], right.getCol()[1], right.getCol()[2]);
  }
  
  /*
  Inputs:
    givenShowR - A boolean represnting weather the right region is to be displayed
  Action: Sets showR to the given value
  */
  void setR(boolean givenShowR) {
    showR = givenShowR;
  }
  
  /*
  Inputs:
    givenShowL - A boolean representing weather the left region is to be displayed
  Action: Sets showL to the given value
  */
  void setL(boolean givenShowL) {
    showL = givenShowL;
  }
  
  boolean getShowL() {
    return showL;
  }
  
  boolean getShowR() {
    return showR;
  }
  
  int[] getCol() {
    return col;
  }
  
  RightRegion getRight() {
    return right;
  }
  
  LeftRegion getLeft() {
    return left;
  }
}
