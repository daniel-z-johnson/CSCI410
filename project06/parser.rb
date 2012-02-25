require "a_lines"
require "c_lines"

class Parser
	attr_accessor :c_com, :a_comm, :valid, :a, :c, :comp, :dest, :jump, :sym

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
			elsif l_struct(i)
				a.add_address_symbol(@sym,line_num)
			end

		end
		p @a.mem_hash
	end


	def gen_hack
		@asm.rewind
		for i in @asm
			i.gsub!(/\/\/.*/,'')
			i.strip!
			machine_code = nil
			if a_struct(i)
				machine_code = @a.instruction(i)
			elsif c_struct(i) and not l_struct(i)
				@dest.gsub!(/\=/,'') if @dest
				@jump.gsub!(/;/,'') if @jump
				# puts "start"
				# puts i
				# p  dest
				# p  comp
				# p  jump
				#puts "end"
				#puts
				machine_code = '111' +  @c.comp_bits(@comp) + @c.dest_bits(@dest) + @c.jump_bits(@jump)
			end
			@hack.write(machine_code + "\n") if machine_code
				
		end
	end

	def isValid?(line)
		line.gsub!(/\/\/.*/,'')
		line.strip!
		if line == "" or l_struct(line)
			#puts "#{line} bla"
			#puts "nil2" if line == "" or line == nil
			return false

		elsif a_struct(line)
			#puts "matched #{$1}"
			return true
		elsif c_struct(line) and not l_struct(line)
			#$1.gsub!("=","") if $1
			#puts "matched 1 #{$1} 2 #{$2} 3 #{$3}"
			unless @c.valid?(@dest,@comp,@jump)
				puts "Invalid C instruction #{line}"
				exit
			end
			return true

		else
			puts "Invalid line #{line}"
			exit
		end

	end

	def c_struct(struct)
		/([AMD]{1,3}=)?([AMD&+-10!\|]{1,3})(;J[GTENQMPL]{1,2})?/.match(struct)
		@comp = $2
		@dest = $1
		@jump = $3
		return /([AMD]{1,3}=)?([AMD&+-10!\|]{1,3})(;J[GTENQMPL]{1,2})?/.match(struct)
	end

	def a_struct(struct)
		/@(.*)/.match(struct)

		return /@(.+)/.match(struct)
	end

	def l_struct(struct)
		/^\((.+)\)/.match(struct)
		@sym = $1
		return /^\((.+)\)/.match(struct)
	end

end
