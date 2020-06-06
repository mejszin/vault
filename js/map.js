let coordData;

function preload() {
	coordData = loadTable("files/coords.csv", "header");
}

function setup() {
	// Set no canvas
  noCanvas();
  // Define Leaflet map
  let options = {
  	attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
	};
  let map = L.map('mapid').setView([50.9079684, -1.4083337], 16);
	L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', options).addTo(map);
	// Create icons
	var protestIcon = L.icon({
	    iconUrl: 'files/protest.png',
	    iconSize: [40, 40],
	    iconAnchor: [40, 40],
	    popupAnchor: [-20, -40]
	});
	var suppliesIcon = L.icon({
	    iconUrl: 'files/supplies.png',
	    iconSize: [40, 40],
	    iconAnchor: [40, 40],
	    popupAnchor: [-20, -40]
	});
	// Create markers
	for (var row = 0; row < coordData.getRowCount(); row++) {
		let type = coordData.getRow(row).get(0);
  	let lat = parseFloat(coordData.getRow(row).get(1));
  	let lon = parseFloat(coordData.getRow(row).get(2));
  	let location = coordData.getRow(row).get(3);
  	let organiser = coordData.getRow(row).get(4);
  	let time = coordData.getRow(row).get(5);
  	let message = coordData.getRow(row).get(6);
  	let desc = "<b>Location</b><br>" + location;
  	desc += "<br><b>Organiser</b><br>" + organiser;
  	desc += "<br><b>Time</b><br>" + time;
  	desc += "<br><b>Mesage</b><br>" + message;
  	console.log(desc);
  	if (type == "Protest") {
			L.marker([lat, lon], { icon: protestIcon }).addTo(map).bindPopup(desc);
  	} else {
  		L.marker([lat, lon], { icon: suppliesIcon }).addTo(map).bindPopup(desc);
  	}
	}
} 

function draw() { 

}