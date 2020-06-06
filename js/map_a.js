let coordData;
let map;
let canvas;
let dataSource;

let protestImg;
let suppliesImg;

const mappa = new Mappa('Leaflet');

let data = [];

let currentColor;

const options = {
  lat: 50.9079684,
  lng: -1.4083337,
  zoom: 12,
  style: "http://{s}.tile.osm.org/{z}/{x}/{y}.png"
}

function preload() {
	coordData = loadTable("files/coords.csv", "header");
	protestImg = loadImage('files/protest.png');
	suppliesImg = loadImage('files/supplies.png');
}

function setup() {
  canvas = createCanvas(displayWidth, displayHeight);
  //canvas.parent('wrapper');
  map = mappa.tileMap(options);
  map.overlay(canvas);

  currentColor = color(255, 0, 200); // default color 
}

function draw() {
  clear();
  for (var row = 0; row < coordData.getRowCount(); row++) {
		let type = coordData.getRow(row).get(0);
  	let lat = parseFloat(coordData.getRow(row).get(1));
  	let lon = parseFloat(coordData.getRow(row).get(2));
  	//console.log(type, lat, lon);
    const pix = map.latLngToPixel(lat, lon);
    fill(currentColor);
    noStroke();
    const zoom = map.zoom();
    if (type == "Protest") {
    	const scl = 0.005 * pow(2, zoom);
    	image(protestImg, pix.x, pix.y, scl, scl);
    } else {
    	const scl = 0.003 * pow(2, zoom);
    	image(suppliesImg, pix.x, pix.y, scl, scl);
    }
    //ellipse(pix.x, pix.y, scl);
    //textSize(scl);
    //textAlign(CENTER, TOP);
    //text(txt, pix.x, pix.y + scl)
	}
}