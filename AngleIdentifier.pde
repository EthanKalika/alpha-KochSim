/*
Author: Ethan Kalika
Date: July 18, 2025
*/

class AngleIdentifier {
  /*
  depth - An integer represeing the order of the curve on which we are identifying the angle
  numRep - The number being represented by the angle identifier
  angleIdentifier - A string storing the base-4 representation of the angle
  */
  int depth, numRep;
  String angleIdentifier;
  
  /*
  Input:
    num - The numerical representation of a vertex
  Action: Creates an instance of an angle identifier for the anlge represented by that number.
  */
  AngleIdentifier(int num) {
    depth = (int)(log(num) / log(4)) + 1;
    numRep = num;
    angleIdentifier = Integer.toString(num, 4);
    }
  
  /*
  Input:
    angleId - The base-4 representation of the vertex as a string
  Action: Creates an instance of an angle identifier for the anlge represented by that base 4 number.
  */
  AngleIdentifier(String angleId) {
    depth = angleId.length();
    numRep = Integer.parseInt(angleId, 4);
    angleIdentifier = angleId;
  }
  
  /*
  Action: Returns the angle identifier of the next vertex.
  */
  AngleIdentifier nextVertex() {
    return new AngleIdentifier(numRep + 1);
  }
  
  /*
  Action: Returns the anlge identifier of the previous vertex.
  */
  AngleIdentifier prevVertex() {
    return new AngleIdentifier(numRep - 1);
  }
  
  int getDepth() {
    return depth;
  }
  
  int getNumRep() {
    return numRep;
  }
  
  String getAngleIdentifier() {
    return angleIdentifier;
  }
}

/*
  Input:
    center - The base-4 representation of the vertex as a string
  Action: Returns the integer representation of the vertex in base 10. This method can be called in constructors which helps reduce the amount of code needed to implement certain objects.
*/
int angleIDWrapper(String center) {
    AngleIdentifier givenVert = new AngleIdentifier(center);
    return givenVert.getNumRep();
}
