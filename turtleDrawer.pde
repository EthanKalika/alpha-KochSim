/*
Author: Ethan Kalika
Date: May 22, 2025
*/

class turtleDrawer {
  boolean isUp;
  float angle;
  PVector coord;

  turtleDrawer(float startX, float startY, boolean lifted) {
    coord = new PVector(startX, startY);
    angle = 0;
    isUp = lifted;
  }
  
  turtleDrawer(float startX, float startY) {
    this(startX, startY, true);
  }

  void forward(float distance) {
    float newX = coord.x + cos(radians(angle)) * distance;
    float newY = coord.y + sin(radians(angle)) * distance;
    if (!isUp) {
      line(coord.x, coord.y, newX, newY);
    }
    coord.x = newX;
    coord.y = newY;
  }

  void ccw(float degrees) {
    angle -= degrees;
  }

  void cw(float degrees) {
    angle += degrees;
  }
  
  void setPos(float givenX, float givenY) {
    coord.x = givenX;
    coord.y = givenY;
  }
  
  void setAngle(float givenAngle) {
    angle = givenAngle;
  }
  
  PVector getPos() {
    return new PVector(coord.x, coord.y);
  }
  
  float getAngle() {
    return angle;
  }
  
  void penUp() {
    isUp = true;
  }
  
  void penDown() {
    isUp = false;
  }
}
