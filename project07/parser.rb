class Parser

	attr_accessor :has_more, :command_type, :arg1, :arg2

	def initialize(input)
	end

	def find_command_type(commnad)
		@command_type = nil
		@arg1 = nil
		@arg2 = nil
		#will find command types and set arges if needed
		#set varibles to nil so if line is comment or no args needed for command, they are already nil
	end


end