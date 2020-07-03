const CANVAS_SIZE = 640;
const PERSPECTIVE = CANVAS_SIZE * 0.8;
const PROJECTION_CENTER = CANVAS_SIZE / 2;
const ROTATION_STEP = 0.01;

var dots;

class Dot {
  constructor(x, y, z) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.radius = 16;
    this.x_projected = 0;
    this.y_projected = 0;
    this.scale_projected = 0;
  }
  
  project() {
    this.scale_projected = PERSPECTIVE / (PERSPECTIVE + this.z);
    this.x_projected = (this.x * this.scale_projected) + PROJECTION_CENTER;
    this.y_projected = (this.y * this.scale_projected) + PROJECTION_CENTER;
  }

  rotateX(angle) {
    var old_y = this.y;
    var old_z = this.z;
    this.y = (old_y * cos(angle)) - (old_z * sin(angle));
    this.z = (old_y * sin(angle)) + (old_z * cos(angle));
  }

  draw() {
    this.project();
    var alpha = map(Math.abs(1 - this.z / CANVAS_SIZE), 0, 1, 0, 255, true);
    stroke(0, 0, 0, alpha);
    strokeWeight(this.radius * this.scale_projected);
    point(this.x_projected, this.y_projected);
  }
}

function setup() {
    // Set canvas
	canvas = createCanvas(CANVAS_SIZE, CANVAS_SIZE);
    canvas.parent('sketch');
    frameRate(30);
    // Create dots
    dots = new Array;
    for (let i = 0; i < 800; i++) {
        var x = (Math.random() - 0.5) * CANVAS_SIZE
        var y = (Math.random() - 0.5) * CANVAS_SIZE
        var z = (Math.random() - 0.5) * CANVAS_SIZE
        dots.push(new Dot(x, y, z));
    }
}

function draw() {
    background("#FFFFFF");
    // Draw dots
    for (let i = 0; i < 800; i++) {
        dots[i].rotateX(ROTATION_STEP);
        dots[i].draw();
    }
}