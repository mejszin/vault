class Player {
  constructor(name, x, y, dir, is_player) {
  	this.name = name
    this.x = x;
    this.y = y;
    this.dir = dir;
    this.is_player = is_player;
    this.latestTime = Infinity;
    if (this.is_player) {
      this.submit();
    }
  }

  move(x, y) {
    var vector = createVector(x - this.x, y - this.y)
    var mag = vector.mag();
    if (mag > 32) {
      mag = 32;
    }
  	this.dir = vector.normalize();
    this.x = this.x + this.dir.x * mag;
    this.y = this.y + this.dir.y * mag;
    this.submit();
  }

  display() {
    if (this.is_player) {
      fill(255, 0, 0);
    } else {
      fill(128)
    }
    ellipse(this.x, this.y, 16, 16);
    line(this.x, this.y, this.x + this.dir.x * 32, this.y + this.dir.y * 32);
  	text(this.name, this.x, this.y + 32);
  }

  submit() {
  	var data = {
  		x: this.x,
  		y: this.y,
  		dir: [this.dir.x, this.dir.y],
      lastAction: firebase.database.ServerValue.TIMESTAMP
  	};
  	var ref = database.ref('mmo/players');
  	ref.child(this.name).set(data, this.gotData);
  }

  gotData(data) {

  }
}