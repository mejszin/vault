TITLE = "machin.dev"
CSS_PATH = "./css/style.css"
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
    "└───────────────────────┘",
]

class Builder
    def initialize
        @head = "<html><head><title>#{TITLE}</title><meta charset=\"utf-8\"><link rel=\"stylesheet\" type=\"text/css\" href=\"#{CSS_PATH}\"/></head><body><center><div style=\"display: inline-block; text-align: left;\"><pre>"
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
        (l...l + w).each_with_index do |x, i|
            (t...t + h).each_with_index do |y, j|
                set(x, y, arr[j][i])
            end
        end
    end

    def box(l, t, w, h, type = 0)
        pad_until(t + h)
        (l...l + w).each_with_index do |x, i|
            (t...t + h).each_with_index do |y, j|
                set(x, y, ["─"][type]) if ((i != 0) && (i != w - 1)) && ((j == 0) || (j == h - 1))
                set(x, y, ["│"][type]) if ((i == 0) || (i == w - 1)) && ((j != 0) && (j != h - 1))
                set(x, y, ["┌"][type]) if ((i == 0) && (j == 0))
                set(x, y, ["┐"][type]) if ((i == w - 1) && (j == 0))
                set(x, y, ["└"][type]) if ((i == 0) && (j == h - 1))
                set(x, y, ["┘"][type]) if ((i == w - 1) && (j == h - 1))
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
page.save