class Code_Writer
	attr_accessor :out
	def initialize(output)
		out = File.new(output,'w')

	end

	def setFileName(in_file_name)
	end

	def write_arithmetic(command)
	end

	def write_push_pop(command)
	end
end