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
    curveOrder - The order of the LRN in which we are identifying the anlge
  Action: Creates an instance of an angle identifier for the anlge represented by that number.
  */
  AngleIdentifier(int num, int curveOrder) {
    depth = curveOrder;
    numRep = num;
    String tempString = Integer.toString(num, 4);
    StringBuilder sb = new StringBuilder();
    while(sb.length() + tempString.length() < depth) {
      sb.append("0");
    }
    sb.append(tempString);
    angleIdentifier = sb.toString();
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
    return new AngleIdentifier(numRep + 1, depth);
  }
  
  /*
  Action: Returns the anlge identifier of the previous vertex.
  */
  AngleIdentifier prevVertex() {
    return new AngleIdentifier(numRep - 1, depth);
  }
  
  /*
  Input:
    givenOrder - The order of the portion of the curve betweem the vertex represented by this angle identifier and the next desired vertex.
  Action: Returns the angle idetifier of the previous vertex of the given order.
  */
  AngleIdentifier prevVertexOfOrder(int givenOrder) {
    if (givenOrder < 1) {
      throw new IllegalArgumentException("The order of a vertex must be larger than 0.");
    }
    int addend = int(pow(4, givenOrder - 1));
    int newVert = numRep - addend;
    if (newVert <= 0) {
      throw new IllegalArgumentException("The given order is too large.");
    }
    return new AngleIdentifier(numRep - addend, depth);
  }
  
  /*
  Input:
    givenOrder - The order of the portion of the curve betweem the vertex represented by this angle identifier and the next desired vertex.
  Action: Returns the angle idetifier of the next vertex of the given order.
  */
  AngleIdentifier nextVertexOfOrder(int givenOrder) {
    if (givenOrder < 1) {
      throw new IllegalArgumentException("The order of a vertex must be larger than 0.");
    }
    int addend = int(pow(4, givenOrder - 1));
    int newVert = numRep - addend;
    if (newVert >= pow(4, depth)) {
      throw new IllegalArgumentException("The given order is too large.");
    }
    return new AngleIdentifier(numRep + addend, depth);
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
