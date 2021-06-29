const CANVAS_SIZE = 320;
const SPACING = 20;
const DIAMETER = 8;
const BKG_CLR = "#0C0D10";
const FRG_CLR = "#FFFFFF";

let orbits = [];

class Orbit {
    constructor(r, n) {
        this.r = r * SPACING;
        this.n = n;
        this.d = DIAMETER;
        this.offset = 0;
        this.speed = (r % 2 == 1) ? random(0.01) : -random(0.01);
    }

    update() {
        this.offset += this.speed;
    }

    show() {
        noFill();
        stroke(FRG_CLR);
        // Ring
        circle(0, 0, this.r * 2);
        // Electrons
        fill(BKG_CLR);
        for(let i = 0; i < this.n; i++) {
            let x = this.r * cos(i * (TWO_PI / this.n) - HALF_PI + this.offset);
            let y = this.r * sin(i * (TWO_PI / this.n) - HALF_PI + this.offset);
            circle(x, y, this.d);
        }
    }
}

function setup() {
    // Set canvas
    canvas = createCanvas(CANVAS_SIZE, CANVAS_SIZE);
    canvas.parent('sketch');
    //noLoop();
    // Set orbits for [Au]
    orbits.push(new Orbit(1, 2));
    orbits.push(new Orbit(2, 8));
    orbits.push(new Orbit(3, 18));
    orbits.push(new Orbit(4, 32));
    orbits.push(new Orbit(5, 18));
    orbits.push(new Orbit(6, 1));
}

function draw() {
    background(BKG_CLR);
    translate(width / 2, height / 2);
    for (let i = 0; i < orbits.length; i++) {
        orbits[i].show();
        orbits[i].update();
    }
}