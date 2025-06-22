/*
Author: Ethan Kalika
Date: June 18, 2025
*/

class polyArc {
  /*
  arc - An ArrayList of PVector objects that holds the coordintes of the vertices of the polygonal arc
  */
  ArrayList<PVector> arc = new ArrayList<PVector>();
  
  /*
  Inputs:
    givenCoords - An ArrayList containing the vertices of the polygonal arc
  Action: Creates an instance of the polygonal arc
  */
  polyArc(ArrayList<PVector> givenCoords) {
    arc = givenCoords;
  }
  
  /*
  Action: Displayes the polygonal arc
  */
  void displayArc() {
    for(int i = 0; i < arc.size() - 1; i++) {
      line(arc.get(i).x, arc.get(i).y, arc.get(i + 1).x, arc.get(i + 1).y);
    }
  }
  
  /*
  Inputs:
    start - The vertex about which the rotation is occuring
    deg - The number of degrees by which the rotation is being performed
  Action: Rotates all vertices to the right of the given start vertex clockwise by the indicated number of degrees
  */
  void rotateRightSubArc(int start, float deg) {
    for (int i = start + 1; i < arc.size(); i++) {
      arc.set(i, arc.get(i).sub(arc.get(start)).rotate(radians(deg)).add(arc.get(start)));
    }
  }
  
  /*
  Inputs:
    end - The vertex after which none of the vertices are rotated
    deg - The number of degrees by which the rotation is being performed
  Action: Rotates all vertices to the left of the end vertex clockwise by the indicated number of degrees
  */
  void rotateLeftSubArc(int end, float deg) {
    for(int i = 0; i < end; i++) {
      arc.set(i, arc.get(i).sub(arc.get(end)).rotate(radians(deg)).add(arc.get(end)));
    }
  }
}
