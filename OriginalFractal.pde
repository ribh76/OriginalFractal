float angle = 0;  
int maxDepth = 20;  

void setup() {
  size(800, 800);  
  background(0);  
  frameRate(60);  
}

void draw() {
  background(0); 
  translate(width / 2, height / 2);  
  rotate(angle);  

  drawSpiral(0, 15); 

  angle += radians(1); 
}

void drawSpiral(int depth, float radiusStep) {
  if (depth >= maxDepth) {
    return; 
  }

 
  float innerRadius = depth * radiusStep;
  float outerRadius = innerRadius + radiusStep;
  float startAngle = radians(depth * 20); 
  float endAngle = startAngle + radians(18); 

  if (depth % 2 == 0) {
    fill(255); 
  } else {
    fill(0); 
  }

  noStroke(); 
  drawArc(innerRadius, outerRadius, startAngle, endAngle); 

  
  drawSpiral(depth + 1, radiusStep);
}


void drawArc(float innerRadius, float outerRadius, float startAngle, float endAngle) {
  beginShape();
  
  for (float a = startAngle; a <= endAngle; a += 0.1) {
    float x = cos(a) * outerRadius;
    float y = sin(a) * outerRadius;
    vertex(x, y);
  }
  for (float a = endAngle; a >= startAngle; a -= 0.1) {
    float x = cos(a) * innerRadius;
    float y = sin(a) * innerRadius;
    vertex(x, y);
  }
  endShape(CLOSE);
}
