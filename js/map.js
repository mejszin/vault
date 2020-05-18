class Tile {
  constructor(i, j, type) {
  	this.i = i;
    this.j = j;
    this.type = type;
    this.is_wall = (type != 0);
  }

  display() {
    image(tileset[this.type], this.i * TILESIZE, this.j * TILESIZE);
  }

  x() {
    return (this.i * TILESIZE) + (TILESIZE / 2);
  }

  y() {
    return (this.j * TILESIZE) + (TILESIZE / 2);
  }
}

class TileMap {
  constructor() {
    this.tiles = [];
    this.data = "111111111111111112222122222222211000010000000001100001000000000120000100001000020000010000100000000001000010000000000200001000001000000000100001100000000010000110000000001000011111111111111111";
    for (var j = 0; j < MAP_HEIGHT; j++) {
      for (var i = 0; i < MAP_WIDTH; i++) {
        var index = (j * MAP_WIDTH) + i;
        var type = int(this.data.charAt(index));
        this.tiles.push(new Tile(i, j, type));
      }
    }
  }

  display() {
    for (var k = 0; k < this.tiles.length; k++) {
      this.tiles[k].display();
    }
  }
}