var pre;
var quote;
var quotes;
var split_string;
var partition = 0;
const str_width = 82;

function preload() {
    quotes = loadStrings('../quotes.txt');
}

function setup() {
    noCanvas();
    frameRate(8);
    // Assign DOM element
    pre = select('#anim');
    // Get quote phrase and pad
    quote = " " + random(quotes) + " ";
    partition = str_width;
    quote += ("·").repeat(str_width - quote.length);
}

function draw() {
    // Calculate string split by partition and rejoined
    split_string = 
        quote.substr(str_width - partition, str_width) + 
        quote.substr(0, str_width - partition);
    // Construct ASCII output // ═=║ |-
    inner = "";
    inner += "┌" + ("─").repeat(str_width) + "┐\n";
    inner += "│" + split_string + "│\n";
    inner += "└" + ("─").repeat(str_width) + "┘";
    // Assign inner HTML to DOM element
    pre.html(inner);
    // Iterate partition index
    //partition = (partition + 1) % str_width;
    partition = partition == 0 ? str_width : partition - 1
}