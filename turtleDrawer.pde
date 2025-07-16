/*
Author: Ethan Kalika
Date: May 22, 2025
*/

class TurtleDrawer {
  /*
  isUp - Boolean indicating if the pen will draw
  angle - The direction the turtle is facing
  coord - The coordinates of the turtle
  */
  boolean isUp;
  float angle;
  PVector coord;
  
  /*
  Inputs:
    startX - The starting x-coordinate of the turtleDrawer
    startY - The starting y-coordinate of the turtleDrawer
    lifted - A boolean representing if the turtleDrawer is lifted or not. The turtleDrawer will only draw when it is not lifted.
  Action: Creates an instance of a turtle drawer with the desired paramteres. The starting anlge is set to 0 by default.
  */
  TurtleDrawer(float startX, float startY, boolean lifted) {
    coord = new PVector(startX, startY);
    angle = 0;
    isUp = lifted;
  }
  
  /*
  Inputs:
    startX - The starting x-coordinate of the turtleDrawer
    startY - The starting y-coordinate of the turtleDrawer
  Action: Creates an instance of a turtle drawer with the desired paramteres. The starting anlge is set to 0 by default. By default the turtleDrawer is lifted and will not draw.
  */
  TurtleDrawer(float startX, float startY) {
    this(startX, startY, true);
  }
  
  /*
  Inputs:
    distance - The length of the line to be drawn or traveled by the turtle
  Action: If isUp is set to true, the turtle will move the desired distance in the angle is is currently facing. Otherwise it will move this distance and draw a line along the path it traveled.
  */
  void forward(float distance) {
    float newX = coord.x + cos(radians(angle)) * distance;
    float newY = coord.y + sin(radians(angle)) * distance;
    if (!isUp) {
      line(coord.x, coord.y, newX, newY);
    }
    coord.x = newX;
    coord.y = newY;
  }
  
  /*
  Inputs:
    degrees - The number of degrees by which to turn the turtle
  Action: Turns the turtle counter clockwise by the desired number of degrees
  */
  void ccw(float degrees) {
    angle -= degrees;
  }
  
  /*
  Inputs:
    degrees - The number of degrees by which to turn the turtle
  Action: Turns the turtle clockwise by the desired number of degrees
  */
  void cw(float degrees) {
    angle += degrees;
  }
  
  /*
  Inputs:
    givenX - The x-coordinate
    givenY - The y-coordinate
  Action:
    Sets the coordinates of the turtle to the designated coordinates
  */
  void setPos(float givenX, float givenY) {
    coord.x = givenX;
    coord.y = givenY;
  }
  
  /*
  Inputs:
    givenAngle - The anlge to which to set the turtle
  Action: Sets the angle the turtle is facing to the given angle
  */
  void setAngle(float givenAngle) {
    angle = givenAngle;
  }
  
  /*
  Action: Returns the coordinates of the turtle
  */
  PVector getPos() {
    return new PVector(coord.x, coord.y);
  }
  
  /*
  Action: Returns the angle the turtle is facing
  */
  float getAngle() {
    return angle;
  }
  
  /*
  Action: Sets turtle to be lifted up
  */
  void penUp() {
    isUp = true;
  }
  
  /*
  Action: Sets turtle to be put down
  */
  void penDown() {
    isUp = false;
  }
}
