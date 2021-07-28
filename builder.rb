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
    def initialize(motd: false)
        script = motd ? "<script src=\"https://cdnjs.cloudflare.com/ajax/libs/p5.js/1.0.0/p5.js\"></script><script src=\"js/anim.js\"></script>" : ""
        @head = "<html><head><title>#{TITLE}</title><meta charset=\"utf-8\"><link rel=\"stylesheet\" type=\"text/css\" href=\"#{CSS_PATH}\"/>#{script}</head><body><center><div style=\"display: inline-block; text-align: left;\"><pre>"
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
        w, h = arr.first.length, arr.length
        pad_until(h)
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
        l, w = 2, PAGE_WIDTH - 5
        left_text = left.join("  ") + " "
        right_text = " " + right.join("  ")
        bullet_text = BULLET * (w - (left_text.length + right_text.length))
        text(l, t, left_text)
        text(l + left_text.length, t, bullet_text)
        text(l + w - right_text.length, t, right_text)
    end

    def partition(t, text, type = 0)
        l, w = 2, PAGE_WIDTH - 5
        partition_text = "==== [ " + text + " ] "
        partition_text += "=" until partition_text.length == w
        text(l, t, partition_text)
    end

    def linkify(text, link)
        anchor = "<a href=\"#{link}\">#{text}</a>"
        @body.each { |row| row.gsub!(text, anchor) }
    end

    def italify(text)
        italics = "<i>#{text}</i>"
        @body.each { |row| row.gsub!(text, italics) }
    end

    def save(path = "build.html")
        page = @head + @body.join("\n") + @tail
        File.write(path, page)
    end

    def debug
        puts @body
    end
end

page = Builder.new(:motd => true)
page.box(0, 13, PAGE_WIDTH - 1, 22)
page.signature
page.text(2, 14, "Written by Louis Machin aka Mejszin")
page.italify("Mejszin")
page.text(38, 16, "CONTENTS")
# Table
page.row(18, ["1.0", "Intro"], ["21/04/2021"])
page.row(19, ["1.1", "About mdev"], ["11/06/2021"])
page.row(20, ["1.2", "Exploring 3D Geometries"], ["21/04/2021"])
page.row(21, ["1.3", "Phyllotaxis"], ["21/04/2021"])
page.partition(23, "EDI RESOURCES")
page.row(25, ["2.0", "Code lists and references"], ["06/05/2021"])
page.row(26, ["2.1", "Curated sample messages"], ["14/05/2021"])
page.row(27, ["2.2", "Various EDI test messages"], ["27/05/2021"])
page.partition(29, "EDI DEVELOPMENT")
page.row(31, ["3.0", "EDI command-line interface"], ["26/07/2021"])
page.row(32, ["3.1", "Introducing the Median EDI client"], ["01/06/2021"])
# Links
page.linkify("Intro ", "./intro.html")
page.linkify("About mdev", "./mdev.html")
# Save
page.debug
page.save