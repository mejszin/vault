class Player {
  constructor(name, x, y, dir, is_player) {
  	this.name = name
    this.x = x;
    this.y = y;
    this.dir = dir;
    this.is_player = is_player;
    this.latestTime = Infinity;
    this.anim_speed = 4;
    this.anim_count = 0;
    this.anim_frame = 0;
    if (this.is_player) {
      this.submit();
    }
  }

  move(x, y) {
    var vector = createVector(x - this.x, y - this.y);
    var mag = (vector.mag() > PLAYER_SPEED) ? PLAYER_SPEED : vector.mag();
  	this.dir = vector.normalize();
    var new_x = this.x + this.dir.x * mag;
    var new_y = this.y + this.dir.y * mag;
    if (this.checkPos(new_x, new_y)) {
      this.x = new_x;
      this.y = new_y;
      this.anim_count++;
      if (this.anim_count >= this.anim_speed) {
        this.anim_count = 0;
        this.anim_frame = (this.anim_frame == 0) ? 1 : 0;
      }
      this.submit();      
    }
  }

  display() {
    if (this.is_player) {
      fill(255, 0, 0);
    } else {
      fill(128);
    }
    //ellipse(this.x, this.y, 16, 16);
    if (!is_moving || !this.is_player) {
      image((this.dir.x < 0) ? player_left_img : player_right_img, this.x - TILESIZE/2, this.y - TILESIZE/2);
    } else {
      if (this.anim_frame == 0) {
        image((this.dir.x < 0) ? player_left_walk_a_img : player_right_walk_a_img, this.x - TILESIZE/2, this.y - TILESIZE/2);
      } else {
        image((this.dir.x < 0) ? player_left_walk_b_img : player_right_walk_b_img, this.x - TILESIZE/2, this.y - TILESIZE/2);
      }
    }
    line(this.x, this.y, this.x + this.dir.x * TILESIZE, this.y + this.dir.y * TILESIZE);
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

  checkPos(new_x, new_y) {
    // Check canvas edge collision
    if (new_x - (TILESIZE / 4) < 0 || new_x + (TILESIZE / 4) > width) {
      return false;
    }
    if (new_y - (TILESIZE / 2) < 0 || new_y + (TILESIZE / 2) > height) {
      return false;
    }
    // Check wall tile collision
    for (var k = 0; k < tilemap.tiles.length; k++) {
      var tile = tilemap.tiles[k];
      if (tile.is_wall) {
        if (createVector(new_x - tile.x(), new_y - tile.y()).mag() < 32) {
          return false;
        }
      }
    }
    return true;
  }

  left() {
    return this.x;
  }

  top() {
    return this.y;
  }

  right() {
    return this.x + TILESIZE;
  }

  bottom() {
    return this.y + TILESIZE;
  }
}