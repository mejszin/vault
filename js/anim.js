var anim_sketch = function(p) {
    p.pre;
    p.quote;
    p.quotes;
    p.split_string;
    p.partition = 0;
    p.str_width = 82;
    
    p.preload = function() {
        p.quotes = p.loadStrings('../motd.txt');
    }
    
    p.setup = function() {
        p.noCanvas();
        p.frameRate(4);
        // Assign DOM element
        p.pre = p.select('#anim');
        // Get quote phrase and pad
        p.quote = " " + p.random(p.quotes) + " ";
        p.partition = p.str_width;
        p.quote += ("·").repeat(p.str_width - p.quote.length);
    }
    
    p.draw = function() {
        // Calculate string split by partition and rejoined
        p.split_string = 
            p.quote.substr(p.str_width - p.partition, p.str_width) + 
            p.quote.substr(0, p.str_width - p.partition);
        // Construct ASCII output // ═=║ |-
        var inner = "";
        inner += "┌" + ("─").repeat(p.str_width) + "┐\n";
        inner += "│" + p.split_string + "│\n";
        inner += "└" + ("─").repeat(p.str_width) + "┘";
        // Assign inner HTML to DOM element
        p.pre.html(inner);
        // Iterate partition index
        //partition = (partition + 1) % str_width;
        p.partition = p.partition == 0 ? p.str_width : p.partition - 1
    }
}

var anim_p5 = new p5(anim_sketch);