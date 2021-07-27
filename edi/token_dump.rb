require 'fileutils'
DIR = "./TOKENDUMP/"
FileUtils.mkdir(DIR)
for path in Dir["**/*.*"] do
    if File.file?(path)
        if File.readlines(path).count { |line| line.include?(ARGV[0]) } > 0
            puts path
            FileUtils.cp(path, DIR + File.basename(path))
        end
    end
end