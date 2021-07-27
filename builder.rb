PAGE_WIDTH = 85
EMPTY_LINE = " " * PAGE_WIDTH
SIGNATURE = [
    "┌───────────────────────┐", 
    "│                       │", 
    "▄▄▄▄▄ ▄▄▄▄▄ ▄▄▄▄▄       │", 
    "█ █ █ █   █ █   █       │", 
    "█ █ █ █▄▄▄█ █           │", 
    "█   █ █   █ █▄▄▄▄       │", 
    "│   ▄   ▄ ▄▄▄▄▄ ▄▄  ▄   │", 
    "│   █   █   █   █ █ █   │", 
    "│   █▄▄▄█   █   █  ██   │", 
    "│   █   █ ▄▄█▄▄ █   █ ▄ │", 
    "│       ▄▄▄▄  ▄▄▄▄▄ ▄   ▄", 
    "│       █   █ █     █   █", 
    "│       █   █ █▄▄▄▄  █ █│", 
    "│       █▄▄▄█ █▄▄▄▄  █▄█│", 
    "│                       │", 
    "└───────────────────────┘"
]

class Builder
    def initialize
        @head = "<html><head><title>machin.dev</title><meta charset=\"utf-8\"><link rel=\"stylesheet\" type=\"text/css\" href=\"./css/style.css\"/></head><body><center><div style=\"display: inline-block; text-align: left;\"><pre>"
        @tail = "</pre></div></center></body></html>"
        @body = []
    end

    def set(x, y, char)
        line = @body[y].chars
        line[x] = char
        @body[y] = line.join
    end

    def pad_until(h)
        @body << EMPTY_LINE until @body.length >= h
    end

    def image(l, t, arr = SIGNATURE)
        w, h = arr.first.length, arr.length
        pad_until(h)
        (l...l + w).each_with_index do |x, x_i|
            (t...t + h).each_with_index do |y, y_i|
                set(x, y, arr[y_i][x_i])
            end
        end
    end

    def box(l, t, w, h, type = 0)
        pad_until(t + h)
        (l...l + w).each_with_index do |x, x_i|
            (t...t + h).each_with_index do |y, y_i|
                set(x, y, ["─"][type]) if ((x_i != 0) and (x_i != w - 1)) and ((y_i == 0) or (y_i == h - 1))
                set(x, y, ["│"][type]) if ((x_i == 0) or (x_i == w - 1)) and ((y_i != 0) and (y_i != h - 1))
                set(x, y, ["┌"][type]) if ((x_i == 0) and (y_i == 0))
                set(x, y, ["┐"][type]) if ((x_i == w - 1) and (y_i == 0))
                set(x, y, ["└"][type]) if ((x_i == 0) and (y_i == h - 1))
                set(x, y, ["┘"][type]) if ((x_i == w - 1) and (y_i == h - 1))
            end
        end
    end

    def save(path = "build.html")
        page = @head + @body.join("\n") + @tail
        File.write(path, page)
    end

    def debug
        puts @body
    end
end

page = Builder.new
page.box(0, 13, PAGE_WIDTH - 1, 20)
page.image(PAGE_WIDTH - SIGNATURE[0].length, 0)
page.debug