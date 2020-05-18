let canvas;
let tilemap;
let player;
let ghosts = [];
let database;
let is_moving = false;

function setup() {
	// Firebase
	var firebaseConfig = {
		apiKey: "AIzaSyAmxjDLZrtiWjQGkekCdTXKx5zCbLDJP28",
		authDomain: "machin-dev.firebaseapp.com",
		databaseURL: "https://machin-dev.firebaseio.com",
		projectId: "machin-dev",
		storageBucket: "machin-dev.appspot.com",
		messagingSenderId: "471389656934",
		appId: "1:471389656934:web:de807290048ad37fa91aa7",
		measurementId: "G-2LDMEXJL3N"
	};
	// Initialize Firebase
	firebase.initializeApp(firebaseConfig);
	firebase.analytics();
	database = firebase.database();
	var ref = database.ref('mmo/players');
  	ref.on('value', gotData, errData);
	// Canvas
	canvas = createCanvas(16 * TILESIZE, 12 * TILESIZE);
	canvas.parent('wrapper');
	canvas.mousePressed(mouseDown);
	canvas.mouseReleased(mouseUp);
	textAlign(CENTER, CENTER);
	frameRate(10);
	// Map
	tilemap = new TileMap();
	// Player
	var name = getURLParams().name;
	if (name == null) {
		name = "Null";
	}
	player = new Player(name, width/2, height/2, createVector(0, 0), true);
}

function draw() {
	background(0);
	// Move
	if (is_moving) {
		move();
	}
	// Display map
	tilemap.display();
	// Display player
	player.display();
	// Display ghosts
	for (var k = 0; k < ghosts.length; k++) {
		ghosts[k].display();
	}
}

function move() {
	player.move(mouseX, mouseY);
}

function mouseDown() {
	is_moving = true;
}

function mouseUp() {
	is_moving = false;
}

function gotData(data) {
	ghosts = [];
	var records = data.val();
	var names = Object.keys(records);
	for (var k = 0; k < names.length; k++) {
		var name = names[k];
		if (name != player.name) {
			var x = records[name].x;
			var y = records[name].y;
			var dir = createVector(records[name].dir[0], records[name].dir[1]);
			var time = records[name].lastAction;
			// 10 minute timeout
			var timeout = 10 * 60 * 1000;
			if (player.latestTime - time < timeout) {
				ghosts.push(new Player(name, x, y, dir, false));
			}
		} else {
			player.latestTime = records[name].lastAction;
		}
	}
	//draw();
}

function errData(err) {

}