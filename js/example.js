var ball;

function setup() {
	canvas = createCanvas(400, 400);
	canvas.parent('sketch');
	ball = new Ball();
}

function draw() {
	background("#F08080");
	ball.update();
	ball.show();
}

class Ball {
	constructor() {
		this.x = width / 2;
		this.y = height / 2;
		this.dir_x = random(-4, 4);
		this.dir_y = random(-4, 4);
		this.radius = 32;
	}

	update() {
		if (this.x + this.dir_x > width  - this.radius / 2) { this.dir_x *= -1 }
		if (this.y + this.dir_y > height - this.radius / 2) { this.dir_y *= -1 }
		if (this.x + this.dir_x < this.radius / 2) { this.dir_x *= -1 }
		if (this.y + this.dir_y < this.radius / 2) { this.dir_y *= -1 }
		this.x += this.dir_x;
		this.y += this.dir_y;
	}

	show() {
		noStroke();
		fill("#FFFFFF");
		ellipseMode(CENTER);
		ellipse(this.x, this.y, this.radius, this.radius);
	}
}