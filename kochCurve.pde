/*
Author: Ethan Kalika
Date: May 22, 2025
*/

import java.util.HashMap;

/*
Input: lengthSides - A float representing the length of the curve
        alpha - The alpha parameter of the curve (given in degrees)
        level - The number of iterations of the alpha koch curve
        sideLengths - A hashmap used to store the parameters at various iterations of the function (this is used for memoization)
Action: Helper function to draw an alpha-Koch curve
*/
private void alphaSnowflakeHelper(float lengthSide, float alpha, int levels, HashMap<Integer, Float> sideLengths) {
  if (levels == 0) {
    t.forward(lengthSide);
    return;
  } else if (sideLengths.containsKey(levels)) {
    lengthSide = sideLengths.get(levels);
    alphaSnowflakeHelper(lengthSide, alpha, levels-1, sideLengths);
    t.ccw(alpha);
    alphaSnowflakeHelper(lengthSide, alpha, levels-1, sideLengths);
    t.cw(2 * alpha);
    alphaSnowflakeHelper(lengthSide, alpha, levels-1, sideLengths);
    t.ccw(alpha);
    alphaSnowflakeHelper(lengthSide, alpha, levels-1, sideLengths);
  } else {
    lengthSide /= 2.0 * (1 + cos(radians(alpha)));
    sideLengths.put(levels, lengthSide);
    alphaSnowflakeHelper(lengthSide, alpha, levels-1, sideLengths);
    t.ccw(alpha);
    alphaSnowflakeHelper(lengthSide, alpha, levels-1, sideLengths);
    t.cw(2 * alpha);
    alphaSnowflakeHelper(lengthSide, alpha, levels-1, sideLengths);
    t.ccw(alpha);
    alphaSnowflakeHelper(lengthSide, alpha, levels-1, sideLengths);
  }
}

/*
Inputs: lengthSides - A float representing the length of the curve
        alpha - The alpha parameter of the curve (given in degrees)
        level - The number of iterations of the alpha koch curve
        t - The turtle object used to draw the curve
Action: Draws the alpha-Koch curve with the given parameters
*/
void alphaSnowflake(float lengthSide, float alpha, int levels, Turtle t) {
  HashMap<Integer, Float> sideLengths = new HashMap<Integer, Float>();
  t.setPos(50, 725);
  alphaSnowflakeHelper(lengthSide, alpha, levels, sideLengths);
}
