/*
Author: Ethan Kalika
Date: May 22, 2025
*/

import java.util.HashMap;

class kochCurve {
  float widthOfCurve, elevation;
  int alpha, level;
  turtleDrawer t;
  polyArc alphaKoch;
  
  kochCurve(float lengthSide, float elev, int givenAlpha, int givenLevel, turtleDrawer turtle) {
    widthOfCurve = lengthSide;
    elevation = elev;
    alpha = givenAlpha;
    level = givenLevel;
    t = turtle;
    alphaKoch = new polyArc(calcPoints(lengthSide, elev, givenAlpha, givenLevel, turtle));
  }
  
  ArrayList<PVector> calcPoints(float lengthSide, float elev, int givenAlpha, int givenLevel, turtleDrawer turtle) {
    ArrayList<PVector> vertices = new ArrayList<PVector>();
    turtle.setPos(50, elev);
    vertices.add(turtle.getPos());
    HashMap<Integer, Float> memo = new HashMap<Integer, Float>();
    recursiveCalcPoints(lengthSide, givenAlpha, givenLevel, turtle, vertices, memo);
    return vertices;
  }
  
  /*
  Input:
    lengthSides - A float representing the length of the curve
    alpha - The alpha parameter of the curve (given in degrees)
    level - The number of iterations of the alpha koch curve
    sideLengths - A hashmap used to store the parameters at various iterations of the function (this is used for memoization)
  Action: Helper function to draw an alpha-Koch curve
  */
  private void recursiveCalcPoints(float lengthSide, int givenAlpha, int levels, turtleDrawer turtle, ArrayList<PVector> vertices, HashMap<Integer, Float> memo) {
    if (levels == 0) {
      t.forward(lengthSide);
      vertices.add(t.getPos());
      return;
    } else {
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
  
  void displayArc() {
    alphaKoch.displayArc();
  }
  
  void rotateLeftSubArc(int end, float deg) {
    alphaKoch.rotateLeftSubArc(end, deg);
  }
  
  void rotateRightSubArc(int start, float deg) {
    alphaKoch.rotateRightSubArc(start, deg);
  }
}
