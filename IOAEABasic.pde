/*
Athor: Ethan Kalika
Date: July 18, 2025
*/

class IOAEABasic extends Action {
  /*
  GOAL: The IOAEABasic algorithm decreases a given angle of the LRN at the expense of another given angle while keeping the right endpoints of the curve fixed. This algorithm has two main limitations.
  Firstly, both angles must open in the same direction, that is to say that their angle bisectors must be parallel. Secondly, this algorithm only adjusts level one sub-arcs of the koch curve. The latter
  will be addressed with the IOAEAExtended algorithm.
  
  trackEndPoint - A boolean that if set to true will mark the endpoint of the LRN to ensure the endoints remain fixed throughout the motion.
  increaseVert - The AngleIdentifier of the vertex whose angle is being increased
  decreaseVert - The AngleIdentifier of the vertex whose angle is being decreased
  nextVertDec - The AngleIdentifier of the vertex to the right of the vertex whose angle is being decreased
  prevVertDec - The AngleIdentifier of the vertex to the left of the vertex whose angle is being decreased
  nextVertInc - The AngleIdentifier of the vertex to the right of the vertex whose angle is being increased
  prevVertInc - The AngleIdentifier of the vertex to the left of the vertex whose angle is being increased
  angleChangeAmount - The amount by which the angle of the decreasing vertex is to be decreased by
  angleCounter - An acumulator variable sotring the amount the angle was currenlty decreased by
  cd - An accumulator variable storing the current measure of the decreasing anlge
  c - A variable storing the measure of the apex angle of the framework before the algorithm started
  ci - An accumulator variable storing the current measure of the increasing angle
  */
  boolean trackEndPoint;
  AngleIdentifier increaseVert, decreaseVert, nextVertDec, prevVertDec, nextVertInc, prevVertInc;
  float angleChangeAmount, angleCounter, cd, c, ci;
  
  /*
  Inputs:
    trackEnd - A boolean representing weather to show the endpoint of the framework
    fancy - A boolean indicating weather to display the framework in fancy mode or not
    center1 - An integer representation of the vertex whose angle is being increased
    center2 - An integer representation of the vertex whose anfle is being decreased
    amount - The amount by which the decreasing anlge should be decreased
    lrn - The given framework
    speed - The rate at which the decreasing angle is to be decreased in degrees per frame
  Action: Creates an instance of an IOAEABasic algorithm.
  */
  IOAEABasic(boolean trackEnd, boolean fancy, int center1, int center2, float amount, LRN lrn, float speed) {
    trackEndPoint = trackEnd;
    isFancy = fancy;
    increaseVert = new AngleIdentifier(center1);
    decreaseVert = new AngleIdentifier(center2);
    nextVertDec = decreaseVert.nextVertex();
    prevVertDec = decreaseVert.prevVertex();
    nextVertInc = increaseVert.nextVertex();
    prevVertInc = increaseVert.prevVertex();
    angleChangeAmount = amount % 360;
    framework = lrn;
    rotationSpeed = speed;
    angleCounter = 0;
    c = radians(180 - 2 * framework.getKochCurve().getAlpha());
    cd = c;
    ci = c;
    
  }
  
  /*
  Inputs:
    center1 - An integer representation of the vertex whose angle is being increased
    center2 - An integer representation of the vertex whose anfle is being decreased
    amount - The amount by which the decreasing anlge should be decreased
    lrn - The given framework
    speed - The rate at which the decreasing angle is to be decreased in degrees per frame
  Action: Creates an instance of an IOAEABasic algorithm. By default the framework is displayed in fancy mode and the endpoint is shown.
  */
  IOAEABasic(int center1, int center2, float amount, LRN lrn, float speed) {
    this(true, true, center1, center2, amount, lrn, speed);
  }
  
  /*
  Inputs:
    fancy - A boolean indicating weather to display the framework in fancy mode or not
    center1 - An string base-4 representation of the vertex whose angle is being increased
    center2 - An string base-4 representation of the vertex whose anfle is being decreased
    amount - The amount by which the decreasing anlge should be decreased
    lrn - The given framework
    speed - The rate at which the decreasing angle is to be decreased in degrees per frame
  Action: Creates an instance of an IOAEABasic algorithm.
  */
  IOAEABasic(boolean trackEnd, boolean fancy, String center1, String center2, float amount, LRN lrn, float speed) {
    trackEndPoint = trackEnd;
    isFancy = fancy;
    increaseVert = new AngleIdentifier(center1);
    decreaseVert = new AngleIdentifier(center2);
    nextVertDec = decreaseVert.nextVertex();
    prevVertDec = decreaseVert.prevVertex();
    nextVertInc = increaseVert.nextVertex();
    prevVertInc = increaseVert.prevVertex();
    angleChangeAmount = amount % 360;
    framework = lrn;
    rotationSpeed = speed;
    angleCounter = 0;
    c = radians(180 - 2 * framework.getKochCurve().getAlpha());
    cd = c;
    ci = c;
  }
  
  /*
  Inputs:
    center1 - An string base-4 representation of the vertex whose angle is being increased
    center2 - An string base-4 representation of the vertex whose anfle is being decreased
    amount - The amount by which the decreasing anlge should be decreased
    lrn - The given framework
    speed - The rate at which the decreasing angle is to be decreased in degrees per frame
  Action: Creates an instance of an IOAEABasic algorithm. By default the framework is displayed in fancy mode and the endpoint is shown.
  */
  IOAEABasic(String center1, String center2, float amount, LRN lrn, float speed) {
    this(true, true, center1, center2, amount, lrn, speed);
  }
  
  /*
  Action: Decreases one angle of the LRN at the expense of another while keeping the endpoints of the curve fixed.
  */
  @Override
  boolean perform() {
    if (angleChangeAmount > angleCounter) {
      float rotateBy = min(rotationSpeed, angleChangeAmount - angleCounter);
      float incAngle = degrees(acos(4 * sqrt((1 - cos(c)) * (1 - cos(cd - radians(rotateBy)))) + 1 - 4 * abs(1 - cos(c)) - abs(1 - cos(cd - rotateBy))) - ci);
      framework.rotateRightSubFrame(prevVertInc.getNumRep(), incAngle / 2);
      framework.rotateRightSubFrame(increaseVert.getNumRep(), -1 * incAngle);
      framework.rotateRightSubFrame(nextVertInc.getNumRep(), incAngle / 2);
      framework.rotateRightSubFrame(prevVertDec.getNumRep(), -1 * rotateBy / 2);
      framework.rotateRightSubFrame(decreaseVert.getNumRep(), rotateBy);
      framework.rotateRightSubFrame(nextVertDec.getNumRep(), -1 * rotateBy / 2);
      angleCounter += rotateBy;
      cd -= radians(rotateBy);
      ci += radians(incAngle);
      background(255);
      if(isFancy) framework.displayFancyLRN();
      else framework.displayLRN();
      if(trackEndPoint) {
        strokeWeight(3);
        point(1450, 600);
        strokeWeight(1);
      }
      return true;
    }
    return false;
  }
}
