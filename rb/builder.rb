TITLE = "machin.dev"
CSS_PATH = "./css/style.css"
BULLET = "·"
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
    def initialize(motd: false, css: CSS_PATH)
        script = motd ? "<script src=\"https://cdnjs.cloudflare.com/ajax/libs/p5.js/1.0.0/p5.js\"></script><script src=\"js/anim.js\"></script>" : ""
        @head = "<html><head><title>#{TITLE}</title><meta charset=\"utf-8\"><link rel=\"stylesheet\" type=\"text/css\" href=\"#{css}\"/>#{script}</head><body><center><div style=\"display: inline-block; text-align: left;\"><pre>"
        script = motd ? "<pre id=\"anim\">\n+#{"-" * (PAGE_WIDTH - 3)}+\n|#{"-" * (PAGE_WIDTH - 3)}|\n+#{"-" * (PAGE_WIDTH - 3)}+</pre>" : ""
        @tail = "</pre>#{script}</div></center></body></html>"
        @body = []
    end

    def set(x, y, char)
        line = @body[y].chars
        line[x] = char
        @body[y] = line.join
    end

    def signature
        image(PAGE_WIDTH - SIGNATURE[0].length, 0)
    end

    def pad_until(h)
        @body << EMPTY_LINE until @body.length >= h
    end

    def image(l, t, arr = SIGNATURE)
        w, h = 0, arr.length; arr.each { |line| w = line.length > w ? line.length : w }
        arr.map! { |line| line.ljust(w, " ") }
        pad_until(t + h)
        (l...l + w).each_with_index do |x, i|
            (t...t + h).each_with_index do |y, j|
                set(x, y, arr[j][i])
            end
        end
    end

    def text(l, t, text)
        image(l, t, [text])
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

    def row(t, left, right)
        pad_until(t + 1)
        l, w = 2, PAGE_WIDTH - 5
        left_text = left.join("  ") + " "
        right_text = " " + right.join("  ")
        bullet_text = BULLET * (w - (left_text.length + right_text.length))
        text(l, t, left_text)
        text(l + left_text.length, t, bullet_text)
        text(l + w - right_text.length, t, right_text)
    end

    def partition(t, text, type = 0, id: true)
        pad_until(t + 1)
        l, w = 2, PAGE_WIDTH - 5
        partition_text = "==== [ " + text + " ] "
        partition_text += "=" until partition_text.length == w
        text(l, t, partition_text)
        replace(partition_text, "<i id=\"#{text}\"></i>#{partition_text}") if id
    end

    def replace(from, to)
        @body.each { |row| row.gsub!(from, to) }
    end

    def linkify(text, link)
        anchor = "<a href=\"#{link}\">#{text}</a>"
        @body.each { |row| row.gsub!(text, anchor) }
    end

    def italify(text)
        italics = "<i>#{text}</i>"
        @body.each { |row| row.gsub!(text, italics) }
    end

    def save(path = "./build.html")
        page = @head + @body.join("\n") + @tail
        begin
            File.write(path, page)
            puts "** Page updated @ #{path}"
        rescue => exception
            puts "** #{exception.message}"
        end
    end

    def debug
        puts @body
    end
end