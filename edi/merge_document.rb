lines = []
lines += File.readlines("edifact_documents_0.csv")
lines += File.readlines("edifact_documents_1.csv")

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