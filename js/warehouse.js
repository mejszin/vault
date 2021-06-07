const CANVAS_SIZE = 720;
const LOCATION_SIZE = 8;

var value;

function preload() {
    table = loadTable('js/test.csv', 'csv');
}

function setup() {
    // Set canvas
    canvas = createCanvas(CANVAS_SIZE, CANVAS_SIZE);
    canvas.parent('sketch');
    background("#0C0D10");
    // Draw warehouse
    stroke("#FFFFFF");
    noFill();
    for (let r = 0; r < table.getRowCount(); r++) {
        for (let c = 0; c < table.getColumnCount(); c++) {
            value = float(table.getString(r, c))
            if (value > 0) {
                rect(c * LOCATION_SIZE, r * LOCATION_SIZE, LOCATION_SIZE, LOCATION_SIZE);
            }
        }
    }
}