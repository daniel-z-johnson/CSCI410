class Parser

	attr_accessor :command_type, :arg1, :arg2, :output

	def initialize(input, c_class)
		#p input
		begin
			f1 = File.new(input, 'r')
		rescue => e
			p e
			puts "Cannot open file #{input}"
			exit
		end

		@output = c_class

		for i in f1
			i.gsub!(/\/\/\.*/,"")
			i.strip!
			find_command_type_args(i) unless i == "" or i
		end
		f1.close()
	end

	def find_command_type_args(commnad)
		@command_type = nil
		@arg1 = nil
		@arg2 = nil
		/(\w*)\s*(\w*)\s*(\d*)/.match(commnad)
		@command_type = $1
		@arg1 = $2
		@arg2 = $3
	end

	def is_Maths?
		/add|sub|eq|gt|lt|neg|and|or|not/.match(@command_type)
	end


end