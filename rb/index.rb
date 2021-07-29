require './builder.rb'

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