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
		@a = Aline.new
		@c = Cline.new
	end

	def generate_sybols
		line_num = 0
		for i in @asm
			valid = isValid?(i)
			if valid
				line_num += 1
			elsif /$(\w*)/.match(i)
				a.add_address_symbol($1,line_num)
			end

		end
	end

	def isValid?(line)
		line.strip!
		if /^\/\//.match(line)
			puts line
			return false
		elsif /@(\W*)/.match(line)
			puts "matched #{$1}"
			return true
		elsif /([AMD]{1,3}=)?([AMD+-10]{1,3});?(J[GTENQMP]{1,2})?/.match(line)
			puts "matched #{$1} 2 #{$2} 3 #{$3}"
			return true

		else
			puts "Invalid Instruction or comment, #{lien}"
		end

	end

end
