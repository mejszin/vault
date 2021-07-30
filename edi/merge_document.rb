lines = []

Dir["./edifact_documents_*.csv"].each { |path| lines += File.readlines(path) }

data = {}

for line in lines do
    edifact, message, description = line.chomp.split(",")
    unless data.key?(message)
        data[message] = description
    end
end

lines = []
for message, description in data do
    lines << "UN/EDIFACT,#{message},#{description}"
end

lines.sort! { |a, b| a <=> b }

File.write("edifact_documents.csv", lines.join("\n"))