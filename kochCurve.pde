/*
Author: Ethan Kalika
Date: May 22, 2025
*/

import java.util.HashMap;

class KochCurve {
  /*
  widthOfCurve - The width of the curve
  xPos - The x-coordinate of the position of the leftmost point on the curve
  yPos - The y-coordinate of the position of the leftmost point on the curve
  alpha - The alpha parameter of the curve
  level - The degree of the curve
  t - The turtle object used to draw the curve
  alphaKoch - The polygonalArc object used to store the points of the curve
  */
  float widthOfCurve, xPos, yPos;
  int alpha, level;
  TurtleDrawer t;
  PolyArc alphaKoch;
  
  /*
  Inputs:
    lengthSide - The desired width of the curve
    startX - The x-coordinate of the start point of the curve
    startY - The y-coordinate of the start point of the curve
    givenAlpha - The desired alpha parameter of the curve
    givenLevel - The degree of the curve
    turtle - The object used to help draw the curve
  Action: Creates an instance of the alpha-Koch curve with the desirec parameters.
  */
  KochCurve(float lengthSide, float startX, float startY, int givenAlpha, int givenLevel, TurtleDrawer turtle) {
    widthOfCurve = lengthSide;
    xPos = startX;
    yPos = startY;
    alpha = givenAlpha;
    level = givenLevel;
    t = turtle;
    alphaKoch = new PolyArc(calcPoints(lengthSide, startX, startY, givenAlpha, givenLevel, turtle));
  }
  
  /*
  Inputs:
    lengthSide - The desired width of the curve
    startX - The x-coordinate of the start point of the curve
    startY - The y-coordinate of the start point of the curve
    givenAlpha - The desired alpha parameter of the curve
    givenLevel - The degree of the curve
    turtle - The object used to help draw the curve
  Action: The is a private function and is not called by the user. It is only used internally. This function performs the necessary setup to calculate the points on the alpha-Koch curve.
  */
  private ArrayList<PVector> calcPoints(float lengthSide, float startX, float startY, int givenAlpha, int givenLevel, TurtleDrawer turtle) {
    ArrayList<PVector> vertices = new ArrayList<PVector>();
    turtle.setPos(startX, startY);
    vertices.add(turtle.getPos());
    HashMap<Integer, Float> memo = new HashMap<Integer, Float>();
    recursiveCalcPoints(lengthSide, givenAlpha, givenLevel, turtle, vertices, memo);
    return vertices;
  }
  
  /*
  Inputs:
    lengthSide - The desired width of the curve
    givenAlpha - The desired alpha parameter of the curve
    givenLevel - The degree of the curve
    turtle - The object used to help draw the curve
    vertices - An ArrayList used to store the points of the alpha-Koch curve
    memo - A HashMap used to store information needed during calculation of the poitns on the curve so that it doesn not need to be recalcualted later.
  Action: The is a private function and is not called by the user. It is only used internally. This function calculates the points on the alpha-Koch curve and stores them in the "vertices" ArrayList.
  */
  private void recursiveCalcPoints(float lengthSide, int givenAlpha, int levels, TurtleDrawer turtle, ArrayList<PVector> vertices, HashMap<Integer, Float> memo) {
    if (levels == 0) {
      t.forward(lengthSide);
      vertices.add(t.getPos());
      return;
    }
    else {
      if (!memo.containsKey(levels)) {
        memo.put(levels, lengthSide / (2.0 * (1 + cos(radians(givenAlpha)))));
      }
      float newLength = memo.get(levels);
      recursiveCalcPoints(newLength, givenAlpha, levels - 1, turtle, vertices, memo);
      t.ccw(givenAlpha);
      recursiveCalcPoints(newLength, givenAlpha, levels - 1, turtle, vertices, memo);
      t.cw(2 * givenAlpha);
      recursiveCalcPoints(newLength, givenAlpha, levels - 1, turtle, vertices, memo);
      t.ccw(givenAlpha);
      recursiveCalcPoints(newLength, givenAlpha, levels - 1, turtle, vertices, memo);
    }
  }
  
  /*
  Action: Displayes the curve
  */
  void displayArc() {
    alphaKoch.displayArc();
  }
  
  /*
  Inputs:
    end - The numerical representation of the point about which the rotation is happening
    deg - The number of degrees of rotation
  Action: Rotates all the points to the left of the point indicated by the end are rotated deg degrees clockwise.
  */
  void rotateLeftSubArc(int end, float deg) {
    alphaKoch.rotateLeftSubArc(end, deg);
  }
  
  /*
  Inputs:
    end - The base 4 represnetaion of the point about which the rotation is happening
    deg - The number of degrees of rotation
  Action: Rotates all the points to the left of the point indicated by the end are rotated deg degrees clockwise.
  */
  void rotateLeftSubArc(String end, float deg) {
    rotateLeftSubArc(angleIDWrapper(end), deg);
  }
  
  /*
  Inputs:
    start - The numerical representation of the point about which the rotation is happening
    deg - The number of degrees of rotation
  Action: Rotates all the points to the right of the point indicated by the start are rotated deg degrees clockwise.
  */
  void rotateRightSubArc(int start, float deg) {
    alphaKoch.rotateRightSubArc(start, deg);
  }
  
  /*
  Inputs:
    start - The base 4 representation of the point about which the rotation is happening
    deg - The number of degrees of rotation
  Action: Rotates all the points to the right of the point indicated by the start are rotated deg degrees clockwise.
  */
  void rotateRightSubArc(String start, float deg) {
    alphaKoch.rotateRightSubArc(angleIDWrapper(start), deg);
  }
  
  float getWidthOfCurve() {
    return widthOfCurve;
  }
  
  float getXPos() {
    return xPos;
  }
  
  float getYPos() {
    return yPos;
  }
  
  int getAlpha() {
    return alpha;
  }
  
  int getLevel() {
    return level;
  }
  
  PolyArc getArc() {
    return alphaKoch;
  }
}
