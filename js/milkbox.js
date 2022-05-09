var milkbox_sketch = function(p) {
    p.pre;
    p.playing;
    p.split_string;
    p.partition = 0;
    p.str_width = 83;
    
    p.preload = function() {
        p.loadJSON('./api/getPlaying',
            data => {
                console.log(data);
                p.playing = data;
            },
            error => {
                console.log( error);
            }
        )
    }

    p.setup = function() {
        p.noCanvas();
        p.frameRate(2);
        // Assign DOM element
        p.pre = p.select('#milkbox');
        // Get quote phrase and pad
        var str = p.playing.artist + ' - ' + p.playing.track + ' (' + p.playing.collection + ')';
        str = str.substr(0, p.str_width - 5);
        p.quote = " " + str + " ";
        p.partition = p.str_width;
        p.quote += ("·").repeat(p.str_width - p.quote.length - 1);
    }
    
    p.draw = function() {
        // Calculate string split by partition and rejoined
        p.split_string = 
            p.quote.substr(p.str_width - p.partition, p.str_width) + 
            p.quote.substr(0, p.str_width - p.partition);
        // Construct ASCII output // ═=║ |-
        var inner = "";
        inner += "▗" + ("╍").repeat(p.str_width) + "▖\n";
        inner += "┇ " + p.split_string + "┇            \n";
        inner += "▝" + ("╍").repeat(p.str_width) + "▘";
        // Assign inner HTML to DOM element
        p.pre.html(inner);
        // Iterate partition index
        //partition = (partition + 1) % str_width;
        p.partition = p.partition == 0 ? p.str_width : p.partition - 1
    }
}

var milkbox_p5 = new p5(milkbox_sketch);


// │       ▄▄▄▄  ▄▄▄▄▄ ▄   ▄
// │       █   █ █     █   █
// 