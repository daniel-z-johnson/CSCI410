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
		@hack = File.new(f2name, "w")
		@a = Aline.new
		@c = Cline.new
	end

	def generate_sybols
		line_num = 0
		for i in @asm
			i.strip! #I enjoy strippers huray, but it makes the regular expressions easier
			if isValid?(i)
				line_num += 1
			elsif /^\((\w*)\)$/.match(i)
				a.add_address_symbol($1,line_num+1)
			end

		end
		p @a.mem_hash
	end


	def gen_hack
		@asm.rewind
		for i in @asm
			i.gsub!(/\/\/.*/,'')
			i.strip!
			if /^@/.match(i)
				machine_code = @a.instruction(i)
			elsif i
				/([AMD]{1,3}=)?([AMD+-10]{1,3})(;J[GTENQMPL]{1,2})?/.match(i)
				dest = $1
				comp = $2
				jump = $3
				dest.gsub(/\=/,'') if dest
				jump.gsub(/;/,'') if jump
				# puts "start"
				# puts i
				# p  @c.dest_bits(dest)
				# p  @c.comp_bits(comp)
				# p @c.jump_bits(jump)
				# puts "end"
				machine_code = '111' + @c.dest_bits(dest) + @c.comp_bits(comp) + @c.jump_bits(jump)
			end
			@hack.write(machine_code)
				
		end
	end

	def isValid?(line)
		line.gsub!(/\/\/.*/,'')
		line.strip!
		if line == "" or /^\((\w*)\)/.match(line)
			puts "#{line} bla"
			#puts "nil2" if line == "" or line == nil
			return false

		elsif /@([a-zA-Z0-9_.]*)/.match(line)
			puts "matched #{$1}"
			return true
		elsif /([AMD]{1,3}=)?([AMD+-10]{1,3})(;J[GTENQMPL]{1,2})?/.match(line)
			#$1.gsub!("=","") if $1
			puts "matched 1 #{$1} 2 #{$2} 3 #{$3}"
			unless @c.valid?($1,$2,$3)
				puts "Invalid C instruction #{line}"
				exit
			end
			return true

		else
			puts "Invalid line #{line}"
			exit
		end

	end

end
