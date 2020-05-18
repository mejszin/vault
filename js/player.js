class Player {
  constructor(name, x, y, dir) {
  	this.name = name
    this.x = x;
    this.y = y;
    this.dir = dir;
  }

  move(x, y) {
  	this.dir = createVector(x - this.x, y - this.y).setMag(32);
    this.x = x;
    this.y = y;
    this.submit();
  }

  display() {
  	fill(255);
    ellipse(this.x, this.y, 16, 16);
    line(this.x, this.y, this.x + this.dir.x, this.y + this.dir.y);
  	text(this.name, this.x, this.y + 32);
  }

  submit() {
  	var data = {
		x: this.x,
		y: this.y,
		dir: [this.dir.x, this.dir.y],
    time: firebase.database.ServerValue.TIMESTAMP
  	};
  	var ref = database.ref('mmo/players');
  	ref.child(this.name).set(data, this.gotData);
  }

  gotData(data) {

  }
}