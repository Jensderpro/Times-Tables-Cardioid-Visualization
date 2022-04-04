float r;
float factor = 0;

void setup() {
  // size(600, 600);
  fullScreen();
  frameRate(30);
  r = height/2 - 16;  
  
}

PVector getVector(float index, float total) {
  float angle = map(index % total, 0, total, 0, TWO_PI);
  PVector v = PVector.fromAngle(angle + PI);
  v.mult(r);
  return v;
}

void draw() {
  background(0);
  int total = 200;
  factor += 0.01;

  translate(width/2, height/2);
  stroke(255, 150);
  strokeWeight(2);
  noFill();
  circle(0, 0, r*2);
  
  strokeWeight(2);
  for (int i = 0; i < total; i++) {
    PVector a = getVector(i, total);
    PVector b = getVector(i * factor, total);
    line(a.x, a.y, b.x, b.y);
  }
  //saveFrame("output/line-####.jpeg");
}
