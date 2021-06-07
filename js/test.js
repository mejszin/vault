const CANVAS_SIZE = 240;

function preload() {
    img = loadImage('../coffeecup_white.png');
}

function setup() {
    // Set canvas
    canvas = createCanvas(CANVAS_SIZE, CANVAS_SIZE);
    canvas.parent('sketch');
    background("#C6A78B");
    image(img, 40, 40, 160, 160);
}