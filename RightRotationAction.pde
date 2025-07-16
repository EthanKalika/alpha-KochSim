/*
Author: Ethan Kalika
Date: July 2, 2025
*/

class RightRotationAction extends Action{
  /*
  rotationVert - The vertex about which the rotation is performed
  rotationSpeed - The number of degrees that the rotation will go through in one frame
  framework - The LRN on which the rotations are performed
  */
  int rotationVert;
  float rotationAmount, rotationCounter;
  
  /*
  Inputs:
    fancy - A boolean representing wheather to display the framework in fancy or normal mode during the action
    center - An intereger representing the vertex that is to serve as the center of the rotation
    amount - The number of degrees by which to rotate in the clockwise direction
    lrn - The framework on which the rotation is to be performed
    speed - The number of degrees by which the subframework is rotated per frame
  Action: Creates an instance of a rotation of the right subframework. Rotation by negative angles is permitted but it must be accompanied by a negative speed.
  */
  RightRotationAction(boolean fancy, int center, float amount, LRN lrn, float speed) {
    isFancy = fancy;
    rotationVert = center;
    rotationSpeed = speed;
    rotationAmount = amount % 360;
    rotationCounter = 0;
    framework = lrn;
  }
  
  /*
  Inputs:
    center - An intereger representing the vertex that is to serve as the center of the rotation
    amount - The number of degrees by which to rotate in the clockwise direction
    lrn - The framework on which the rotation is to be performed
    speed - The number of degrees by which the subframework is rotated per frame
  Action: Creates an instance of a rotation of the right subframework. Rotation by negative angles is permitted but it must be accompanied by a negative speed. By default isFancy is set to true.
  */
  RightRotationAction(int center, float amount, LRN lrn, float speed) {
    this(true, center, amount, lrn, speed);
  }
  
  /*
  Action: Performs the rotation.
  */
  @Override
  boolean perform() {
    if (rotationSpeed == 0) return false;
    float rotationLeft = rotationAmount - rotationCounter;
    boolean shouldContinue = (rotationSpeed > 0 && rotationCounter < rotationAmount) || (rotationSpeed < 0 && rotationCounter > rotationAmount);
    if (shouldContinue) {
      float rotateBy = constrain(rotationSpeed, min(rotationLeft, rotationSpeed), max(rotationLeft, rotationSpeed));
      framework.rotateRightSubFrame(rotationVert, rotateBy);
      background(255);
      if (isFancy) framework.displayFancyLRN();
      else framework.displayLRN();
      rotationCounter += rotateBy;
      return true;
    }
    return false;
  }
}
