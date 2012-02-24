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
			i.strip! #I enjoy strippers huray, but it makes the regular expressions easier
			if isValid?(i)
				line_num += 1
			elsif /^\((\w*)\)/.match(i)
				a.add_address_symbol($1,line_num)
			end

		end
	end

	def isValid?(line)
		line.strip!
		if /^\/\//.match(line) or line == "" or /^\((\w*)\)/.match(line)
			puts "#{line} bla"
			#puts "nil2" if line == "" or line == nil
			return false

		elsif /@(\w*)/.match(line)
			puts "matched #{$1}"
			return true
		elsif /([AMD]{1,3})?=?([AMD+-10]{1,3});?(J[GTENQMPL]{1,2})?/.match(line)
			#$1.gsub!("=","") if $1
			puts "matched 1 #{$1} 2 #{$2} 3 #{$3}"
			#puts "nil" if $1 == nil
			return true

		else
			puts "Invalid line #{line}"
		end

	end

end
