require 'fileutils'

DIR = "./TOKENDUMP/"
EXT = ".edi"

FileUtils.mkdir(DIR) unless File.exists?(DIR)

for from_path in Dir["**/*.*"] do
    if File.file?(from_path)
        if File.readlines(from_path).count { |line| line.include?(ARGV[0]) } > 0
            puts from_path
            to_path = DIR + rand(10000).to_s.rjust(5, "0") + "_" + File.basename(from_path) + EXT
            FileUtils.cp(from_path, to_path)
        end
    end
end