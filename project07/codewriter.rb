require 'erb'
class Code_Writer
	attr_accessor :out, :command, :segment, :value, :jummp_count
	def initialize(output)
		@out = File.new(output,'w')
		@jummp_count = 0 #I always count from zero now, it confuses the pants of people around me, useful at parties
	end

	def setFileName(in_file_name)
	end

	def write_arithmetic(command)
		#puts "In write_arithmetic #{command}" #part of a debug at one point
		command += ".erb"
		begin
			f1 = File.new(command, "r")
		rescue => e
			puts e
			exit
		end
		for i in f1
			erb = ERB.new(i)
			@out.write erb.result(binding)
		end
		@jummp_count += 1 if increase_jump?
	end

	def increase_jump?
		/eq|jt|lt/.match(command)
	end

	def write_push_pop(command, seg, arg)
		#puts "In write_push_pop #{command} #{seg} #{arg}" #same here, look at write_arithmetic
		file = command + "_" + seg + ".erb"
		@value = arg
		begin
			f1 = File.new(file, "r")
		rescue => e
			puts e
			exit
		end
		for i in f1
			erb = ERB.new(i)
			@out.write erb.result(binding)
		end
	end
end