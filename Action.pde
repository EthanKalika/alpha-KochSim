/*
Author: Ethan Kalika
Date: July 2, 2025
*/

abstract class Action {
  /*
  isFancy - A boolean representing if the framework is to be displayed in normal or fancy mode during the action
  rotationSpeed - A float representing the number of degrees the each rotation will make per frame it is active
  framework - The framework on which the action is performed
  */
  boolean isFancy;
  float rotationSpeed;
  LRN framework;
  
  /*
  This is the method used to perform actions
  */
  abstract boolean perform();
}
