var grid;
var click = 0;
var output;

function setup() {
	canvas = createCanvas(640, 512);
	canvas.parent('sketch');
	grid = new Grid(20);
	output = select('#output');
	console.log(output);
}

function draw() {
	translate(width / 2, height / 2);
	background("#AEAEAE");
	grid.show();
}

function mouseClicked() {
	click++;
	if (click % 2 == 0) {
		grid.set_a(mouseX, mouseY);
	} else {
		grid.set_b(mouseX, mouseY);
	}
}

class Grid {
	constructor(gap) {
		this.gap = gap;
		this.a_x = width / 2;
		this.a_y = height / 2;
		this.b_x = width / 2;
		this.b_y = height / 2;
	}

	show() {
		// Grid lines
		stroke("#FFFFFF");
		strokeWeight(1);
		for (var i = -width / 2 ; i * this.gap < width / 2 ; i++) { line(i * this.gap, -height / 2, i * this.gap, height / 2)  }
		for (var j = -height / 2; j * this.gap < height / 2; j++) { line(-width / 2, j * this.gap,  width / 2, j * this.gap) }
		// Axis
		strokeWeight(4);
		line(0, -height / 2, 0, height / 2);
		line(-width / 2, 0, width / 2, 0);
		// Line
		if ((this.a_x != this.b_x) && (this.a_y != this.b_y)) {
			// Values
			var m = (this.b_y - this.a_y) / (this.b_x - this.a_x);
			var c = (this.a_y - (m * this.a_x)) * this.gap;
			//
			stroke("#F08080");
			strokeWeight(2);
			line(-width / 2, m * (-width / 2) + c, width / 2, m * (width / 2) + c);
			// Text
			noStroke();
			textSize(32);
			if (c == 0) {
				output.html('y = ' + -round(m * 10) / 10 + 'x');
			} else {
				output.html('y = ' + -round(m * 10) / 10 + 'x + ' + -round(c * 10) / 10);
			}
		} else {
			output.html('');
		}
		// Points
		ellipseMode(CENTER);
		noStroke();
		fill("#F08080");
		ellipse(this.a_x * this.gap, this.a_y * this.gap, 8, 8);
		ellipse(this.b_x * this.gap, this.b_y * this.gap, 8, 8);
	}

	set_a(x, y) {
		this.a_x = round((x - width / 2)  / this.gap);
		this.a_y = round((y - height / 2) / this.gap);
	}

	set_b(x, y) {
		this.b_x = round((x - width / 2)  / this.gap);
		this.b_y = round((y - height / 2) / this.gap);
	}
}