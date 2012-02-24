require "a_lines"
require "c_lines"

class Parser
	attr_accessor :c_com, :a_comm, :valid, :a, :c

	def initialize(file_name)
		begin
		@asm = File.new(ARGV[0], "r")
		rescue
			puts "Could not open file #{ARGV[0]}"
			exit
		end
		f2name = ARGV[0].gsub(/\.asm$/,".hack")
		#puts "generated #{f2name}"
		hack = File.new(f2name, "w")
	end

	def generate_sybols
		line_num = 0
		for i in @asm
			valid = isValid?(i)
			if valid
				line_num += 1
			elsif /$(\w*)/.match(i)
				#add_address_symbol($1,line_num)
			end

		end
	end

	def isValid?(line)
		if /^\s*\/\/|$(\w*)/.match(line)
			puts line
			return false 
		end

	end

end
