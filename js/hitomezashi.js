const A = [1, 0, 0, 1, 0, 1, 0, 1, 1, 0, 0, 0, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 1, 1, 1, 0, 0, 0];
const B = [1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 1, 1, 1, 0, 1, 0, 0, 1, 0];

const CANVAS_SIZE = 640;
const SIZE = CANVAS_SIZE / A.length;

function setup() {
    // Set canvas
    canvas = createCanvas(CANVAS_SIZE, CANVAS_SIZE);
    canvas.parent('sketch');
    noLoop();
    background("#0C0D10");
    stroke("#FFFFFF");
    strokeWeight(4);
}

function draw() {
    // Draw across lines
    for (let a = 0; a < A.length; a++) {
        for (let x = (A[a] % 2); x < B.length; x += 2) {
            stroke(random(100, 200), random(100, 200), random(100, 200));
            line(x * SIZE, a * SIZE, (x + 1) * SIZE, a * SIZE)
        }
    }
    // Draw across lines
    for (let b = 0; b < B.length; b++) {
        for (let y = (B[b] % 2); y < A.length; y += 2) {
            stroke(random(100, 200), random(100, 200), random(100, 200));
            line(b * SIZE, y * SIZE, b * SIZE, (y + 1) * SIZE)
        }
    }
}