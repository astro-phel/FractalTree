private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle = .2;  
color treeColor = color(0, 150, 0);

public void setup(){   
  size(640, 480);    
  noLoop();
}

public void draw(){   
  background(0);   
  stroke(treeColor);
  
  //main
  line(320, 480, 320, 380);   
  drawBranches(320, 380, 100, 3 * Math.PI / 2);  
  
  //left
  line(160, 480, 160, 410);  
  drawBranches(160, 410, 70, 3 * Math.PI / 2);  

  //right
  line(480, 480, 480, 410); 
  drawBranches(480, 410, 70, 3 * Math.PI / 2);
}
public void drawBranches(int x, int y, double branchLength, double angle){   
  double a1 = angle + branchAngle;
  double a2 = angle - branchAngle;
  branchLength *= fractionLength;
  
  int endX1 = (int)(branchLength * Math.cos(a1) + x);
  int endY1 = (int)(branchLength * Math.sin(a1) + y);
  int endX2 = (int)(branchLength * Math.cos(a2) + x);
  int endY2 = (int)(branchLength * Math.sin(a2) + y);

  line(x, y, endX1, endY1);
  line(x, y, endX2, endY2);

  if (branchLength > smallestBranch) {
    drawBranches(endX1, endY1, branchLength, a1);
    drawBranches(endX2, endY2, branchLength, a2);
  }
}
public void mousePressed(){
  treeColor = color(random(150), random(150), random(150));
  redraw();
}
