require "parser"



#make sure there is a input file
if ARGV.count != 1
	puts "Error should have one argument, not more or none"
	exit
end

#Make sure the file is .asm
unless /\.asm$/.match(ARGV[0])
	puts "File must be a .asm file"
	exit
end

# #debug, make sure changing name from *.asm to *.hack
# begin
# 	asm = File.new(ARGV[0], "r")
# rescue
# 	puts "Could not open file #{ARGV[0]}"
# 	exit
# end
# f2name = ARGV[0].gsub(/\.asm$/,".hack")
# #puts "generated #{f2name}"
# hack = File.new(f2name, "w")
#made sure everything was working in readind
=begin
asm.each do |i|
	puts i
end
=end

p = Parser.new(ARGV[0])
p.generate_sybols
p.gen_hack

#=begin tests to make sure a_line is working
# a = Aline.new
# a.testHash('R0')
# a.testHash('R11')
# a.testHash('R14')
# a.testHash('test')
# a.testHash('test')
# puts a.instruction('@R15')
# a.add_address_symbol('birthday',23)
# puts a.instruction('@birthday')
# puts a.instruction('@test')
#=end



# asm.close()
# hack.close()
