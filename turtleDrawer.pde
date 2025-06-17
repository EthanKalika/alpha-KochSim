/*
Author: Ethan Kalika
Date: May 22, 2025
*/

class Turtle {
  float x, y, angle;

  Turtle(float startX, float startY) {
    x = startX;
    y = startY;
    angle = 0;
  }

  void forward(float distance) {
    float newX = x + cos(radians(angle)) * distance;
    float newY = y + sin(radians(angle)) * distance;
    line(x, y, newX, newY);
    x = newX;
    y = newY;
  }

  void ccw(float degrees) {
    angle -= degrees;
  }

  void cw(float degrees) {
    angle += degrees;
  }
  
  void setPos(float givenX, float givenY) {
    x = givenX;
    y = givenY;
  }
  
  void setAngle(float givenAngle) {
    angle = givenAngle;
  }
  
  float[] getPos() {
    return new float[] {x, y};
  }
  
  float getAngle() {
    return angle;
  }
}
