let canvas;
let player;
let ghosts = [];
let database;

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
	canvas = createCanvas(640, 360);
	canvas.parent('wrapper');
	canvas.mouseClicked(move);
	noLoop();
	// Player
	var name = getURLParams().name;
	if (name == null) {
		name = "Null";
	}
	player = new Player(name, random(width), random(height), createVector(0, 0), true);
}

function draw() {
	background(100);
	// Display player
	player.display();
	// Display ghosts
	for (var i = 0; i < ghosts.length; i++) {
		ghosts[i].display();
	};
}

function move() {
	player.move(mouseX, mouseY);
}

function gotData(data) {
	ghosts = [];
	var records = data.val();
	var names = Object.keys(records);
	for (var i = 0; i < names.length; i++) {
		var name = names[i];
		if (name != player.name) {
			var x = records[name].x;
			var y = records[name].y;
			var dir = createVector(records[name].dir[0], records[name].dir[1]);
			var time = records[name].lastAction;
			// 10 minute timeout
			var timeout = 0.1 * 60 * 1000;
			print(player.latestTime, time, player.latestTime - time, timeout);
			if (player.latestTime - time < timeout) {
				ghosts.push(new Player(name, x, y, dir, false));
			}
		} else {
			player.latestTime = records[name].lastAction;
		}
	};
	draw();
}

function errData(err) {

}