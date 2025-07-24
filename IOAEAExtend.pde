/*
Author: Ethan Kalika
Date: July 21, 2025
*/

class IOAEAExtend extends Action {
  /*
  GOAL: The IOAEAExtend action decreases a given angle of the LRN at the expense of another given angle while keeping the right endpoints of the curve fixed. Unlike the IOAEABasic action this action can
  manipulate sub-arcs of any order.
  
  trackEndPoint - A boolean that if set to true will mark the endpoint of the LRN to ensure the endoints remain fixed throughout the motion.
  increaseOrder - The order of the sub-arc that is to be rotated to increase the increasing angle
  decreaseOrder - The order of the sub-arc that is to be rotated to decrease the decreasing angle
  angleChangeAmount - The amount by which the angle of the decreasing vertex is to be decreased by
  angleCounter - An acumulator variable sotring the amount the angle was currenlty decreased by
  cd - An accumulator variable storing the current measure of the decreasing anlge
  c - A variable storing the measure of the apex angle of the framework before the algorithm started
  ci - An accumulator variable storing the current measure of the increasing angle
  ld - The side lengths of the angle being decreased
  li - The side lengths of the angle being increased
  increaseVert - The AngleIdentifier of the vertex whose angle is being increased. Note, all angles are entered as degrees by the user, but are treated internally as radians.
  decreaseVert - The AngleIdentifier of the vertex whose angle is being decreased
  nextVertDec - The AngleIdentifier of the vertex to the right of the vertex whose angle is being decreased
  prevVertDec - The AngleIdentifier of the vertex to the left of the vertex whose angle is being decreased
  nextVertInc - The AngleIdentifier of the vertex to the right of the vertex whose angle is being increased
  prevVertInc - The AngleIdentifier of the vertex to the left of the vertex whose angle is being increased
  */
  boolean trackEndPoint;
  int increaseOrder, decreaseOrder;
  float angleChangeAmount, angleCounter, cd, c, ci, ld, li;
  AngleIdentifier increaseVert, decreaseVert, nextVertDec, prevVertDec, nextVertInc, prevVertInc;
  
  /*
  Inputs:
    trackEnd - A boolean representing weather to show the endpoint of the framework
    fancy - A boolean indicating weather to display the framework in fancy mode or not
    center1 - An integer representation of the vertex whose angle is being increased
    order1 - The order of the sub-arc that is to be rotated to increase the increasing angle
    center2 - An integer representation of the vertex whose anfle is being decreased
    order2 - The order of the sub-arc that is to be rotated to decrease the decreasing angle
    amount - The amount by which the decreasing anlge should be decreased
    lrn - The given framework
    speed - The rate at which the decreasing angle is to be decreased in degrees per frame
  Action: Creates an instance of an IOAEABasic algorithm.
  */
  IOAEAExtend(boolean trackEnd, boolean fancy, int center1, int order1, int center2, int order2, float amount, LRN lrn, float speed) {
    trackEndPoint = trackEnd;
    isFancy = fancy;
    framework = lrn;
    increaseOrder = order1;
    decreaseOrder = order2;
    int frameOrder = lrn.getKochCurve().getLevel();
    increaseVert = new AngleIdentifier(center1, frameOrder);
    decreaseVert = new AngleIdentifier(center2, frameOrder);
    nextVertDec = decreaseVert.nextVertexOfOrder(order2);
    prevVertDec = decreaseVert.prevVertexOfOrder(order2);
    nextVertInc = increaseVert.nextVertexOfOrder(order1);
    prevVertInc = increaseVert.prevVertexOfOrder(order1);
    angleChangeAmount = radians(amount % 360);
    rotationSpeed = radians(speed);
    angleCounter = 0;
    c = radians(180 - 2 * framework.getKochCurve().getAlpha());
    cd = c;
    ci = c;
    ld = lrn.getKochCurve().getWidthOfCurve() / (pow(2 + 2 * cos(radians(lrn.getKochCurve().getAlpha())), frameOrder - order2));
    li = lrn.getKochCurve().getWidthOfCurve() / (pow(2 + 2 * cos(radians(lrn.getKochCurve().getAlpha())), frameOrder - order1));
  }
  
  /*
  Inputs:
    center1 - An integer representation of the vertex whose angle is being increased
    order1 - The order of the sub-arc that is to be rotated to increase the increasing angle
    center2 - An integer representation of the vertex whose anfle is being decreased
    order2 - The order of the sub-arc that is to be rotated to decrease the decreasing angle
    amount - The amount by which the decreasing anlge should be decreased
    lrn - The given framework
    speed - The rate at which the decreasing angle is to be decreased in degrees per frame
  Action: Creates an instance of an IOAEABasic algorithm. By default the framework is displayed in fancy mode and the endpoint is shown.
  */
  IOAEAExtend(int center1, int order1, int center2, int order2, float amount, LRN lrn, float speed) {
    this(true, true, center1, order1, center2, order2, amount, lrn, speed);
  }
  
  /*
  Inputs:
    fancy - A boolean indicating weather to display the framework in fancy mode or not
    center1 - An string base-4 representation of the vertex whose angle is being increased
    order1 - The order of the sub-arc that is to be rotated to increase the increasing angle
    center2 - An string base-4 representation of the vertex whose anfle is being decreased
    order2 - The order of the sub-arc that is to be rotated to decrease the decreasing angle
    amount - The amount by which the decreasing anlge should be decreased
    lrn - The given framework
    speed - The rate at which the decreasing angle is to be decreased in degrees per frame
  Action: Creates an instance of an IOAEABasic algorithm.
  */
  IOAEAExtend(boolean trackEnd, boolean fancy, String center1, int order1, String center2, int order2, float amount, LRN lrn, float speed) {
    trackEndPoint = trackEnd;
    isFancy = fancy;
    increaseOrder = order1;
    decreaseOrder = order2;
    increaseVert = new AngleIdentifier(center1);
    decreaseVert = new AngleIdentifier(center2);
    nextVertDec = decreaseVert.nextVertexOfOrder(order2);
    prevVertDec = decreaseVert.prevVertexOfOrder(order2);
    nextVertInc = increaseVert.nextVertexOfOrder(order1);
    prevVertInc = increaseVert.prevVertexOfOrder(order1);
    angleChangeAmount = radians(amount % 360);
    rotationSpeed = radians(speed);
    angleCounter = 0;
    framework = lrn;
    c = radians(180 - 2 * framework.getKochCurve().getAlpha());
    cd = c;
    ci = c;
    int frameOrder = lrn.getKochCurve().getLevel();
    ld = lrn.getKochCurve().getWidthOfCurve() / (pow(2 + 2 * cos(radians(lrn.getKochCurve().getAlpha())), frameOrder - order2));
    li = lrn.getKochCurve().getWidthOfCurve() / (pow(2 + 2 * cos(radians(lrn.getKochCurve().getAlpha())), frameOrder - order1));
  }
  
  /*
  Inputs:
    center1 - An string base-4 representation of the vertex whose angle is being increased
    order1 - The order of the sub-arc that is to be rotated to increase the increasing angle
    center2 - An string base-4 representation of the vertex whose angle is being decreased
    order2 - The order of the sub-arc that is to be rotated to decrease the decreasing angle
    amount - The amount by which the decreasing anlge should be decreased
    lrn - The given framework
    speed - The rate at which the decreasing angle is to be decreased in degrees per frame
  Action: Creates an instance of an IOAEABasic algorithm. By default the framework is displayed in fancy mode and the endpoint is shown.
  */
  IOAEAExtend(String center1, int order1, String center2, int order2, float amount, LRN lrn, float speed) {
    this(true, true, center1, order1, center2, order2, amount, lrn, speed);
  }
  
  /*
  Action: Decreases one angle of the LRN at the expense of another while keeping the endpoints of the curve fixed.
  */
  @Override
  boolean perform() {
    if (angleChangeAmount > angleCounter) {
      float rotateBy = min(rotationSpeed, angleChangeAmount - angleCounter);
      float incAngle = acos(1 - 0.5 * pow((ld / li) * (sqrt(2 - 2 * cos(c)) - sqrt(2 - 2 * cos(cd - rotateBy))) + sqrt(2 - 2 * cos(c)), 2)) - ci;
      if (Float.isNaN(incAngle)) {
        throw new IllegalArgumentException("The selected angle or vertex order caused the arccos function to be applied to an invalid argument.");
      }
      framework.rotateRightSubFrame(prevVertInc.getNumRep(), degrees(incAngle / 2));
      framework.rotateRightSubFrame(increaseVert.getNumRep(), degrees(-1 * incAngle));
      framework.rotateRightSubFrame(nextVertInc.getNumRep(), degrees(incAngle / 2));
      framework.rotateRightSubFrame(prevVertDec.getNumRep(), degrees(-1 * rotateBy / 2));
      framework.rotateRightSubFrame(decreaseVert.getNumRep(), degrees(rotateBy));
      framework.rotateRightSubFrame(nextVertDec.getNumRep(), degrees(-1 * rotateBy / 2));
      angleCounter += rotateBy;
      cd -= rotateBy;
      ci += incAngle;
      background(255);
      if(isFancy) framework.displayFancyLRN();
      else framework.displayLRN();
      if(trackEndPoint) {
        strokeWeight(3);
        point(framework.getKochCurve().getXPos() + framework.getKochCurve().getWidthOfCurve(), framework.getKochCurve().getYPos());
        strokeWeight(1);
      }
      return true;
    }
    print("IOAEAExtend Complete: ");
    return false;
  }
}
