require "a_lines"
require "c_lines"

#make sure there is a input fiel
if ARGV.count != 1
	puts "Error should have one argument"
	exit
end

#Make sure the file is .asm
unless /\.asm/.match(ARGV[0])
	puts "File must be a .asm file"
	exit
end

#debug, make sure changing name from *.asm to *.hack
asm = File.new(ARGV[0], "r")
f2name = ARGV[0].gsub(/\.asm/,".hack")
#puts f2name
hack = File.new(f2name, "w")
asm.each do |i|
	puts i
end
a = Aline.new
a.testHash('R0')
a.testHash('R11')
a.testHash('R14')




asm.close()
hack.close()
