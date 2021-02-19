
boolean debug = true;

// A path object (series of connected points)
Path path;

// Two vehicles
Vehicle car1;
Vehicle car2;
Vehicle car3;

void setup() {
  size(1040, 460);
  // Call a function to generate new Path object
  newPath();

  // Each vehicle has different max speed and maxforce for demo purposes
  car1 = new Vehicle(new PVector(0, height/2), 2.5, 0.1);
  car2 = new Vehicle(new PVector(0, height/2), 3.5, 0.15);
  car3 = new Vehicle(new PVector(0, height/2), 2, 0.1);
}

void draw() {
  background(255);
  // Display the path
  path.display();
  // The boids follow the path
  car1.follow(path);
  car2.follow(path);
  car3.follow(path);

  // Call the generic run method (update, borders, display, etc.)
  car1.run();
  car2.run();
  car3.run();
  
  car1.borders(path);
  car2.borders(path);
  car3.borders(path);

  // Instructions
  fill(0);
  text("Hit space bar to toggle orthogonal lines.\nClick to generate a new path.", 10, height-30);
}

void newPath() {
  // A path is a series of connected points
  // A more sophisticated path might be a curve
  path = new Path();
  path.addPoint(-20, height/2);
  path.addPoint(random(0, width/2), random(0, height));
  path.addPoint(random(width/2, width), random(0, height));
  path.addPoint(width+20, height/2);
}

public void keyPressed() {
  if (key == ' ') {
    debug = !debug;
  }
}

public void mousePressed() {
  newPath();
}
