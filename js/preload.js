const TILESIZE = 32;
const MAP_WIDTH = 16;
const MAP_HEIGHT = 12;
const PLAYER_SPEED = 8;

let player_left_img;
let player_right_img;

let tileset = [];

function preload() {
	player_left_img = loadImage('img/player_left.png');
	player_right_img = loadImage('img/player_right.png');
	player_left_walk_a_img = loadImage('img/player_left_walk_a.png');
	player_right_walk_a_img = loadImage('img/player_right_walk_a.png');
	player_left_walk_b_img = loadImage('img/player_left_walk_b.png');
	player_right_walk_b_img = loadImage('img/player_right_walk_b.png');
	tileset.push(loadImage('img/0.png'));
	tileset.push(loadImage('img/1.png'));
	tileset.push(loadImage('img/2.png'));
}