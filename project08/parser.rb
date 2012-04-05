class Parser

	attr_accessor :command_type, :arg1, :arg2, :output

	def initialize(input, c_class)
		#p input
		puts "In parser initialize"
		begin
			f1 = File.new(input, 'r')
		rescue => e
			p e
			puts "Cannot open file #{input}"
			exit
		end

		@output = c_class

		for i in f1
			i.gsub!(/\/\/.*/,"")
			i.strip!
			unless i == ""
				find_command_type_args(i)
				if is_maths?
					c_class.write_arithmetic(@command_type)
				elsif push_or_pops?
					c_class.write_push_pop(@command_type, @arg1, @arg2)
				elsif label?
					c_class.write_label @arg1
				elsif if_goto?
					c_class.write_if_goto @arg1
				elsif goto?
					c_class.write_goto @arg1
				elsif function?
					c_class.write_func(@arg1, @arg2)
				elsif call?
					c_class.write_call(@arg1, @arg2)
				elsif return?
					c_class.write_return
				else
					puts "VM does not reconize command '#{i}' currently"
					exit
				end
			end

		end
		f1.close()
	end

	def find_command_type_args(commnad) #parses the command, should work, tested it in rubular.com, 
		@command_type = nil             #great website that meets all regular explressions needs
		@arg1 = nil
		@arg2 = nil
		/(\S*)\s*(\S*)\s*(\d*)/.match(commnad)
		#puts $1
		@command_type = $1
		@arg1 = $2
		@arg2 = $3
		nil
	end

	def is_maths? #test to see if comand if a math command
		/add|sub|eq|gt|lt|neg|and|or|not/.match(@command_type)
	end

	def push_or_pops?
		/push|pop/.match(@command_type)
	end

	def label?
		/label/.match(@command_type)
	end

	def goto?
		/goto/.match(@command_type)
	end

	def if_goto?
		/if-goto/.match(@command_type)
	end

	def function?
		/function/.match(@command_type)
	end

	def call?
		/call/.match(@command_type)
	end

	def return?
		/return/.match(@command_type)
	end


end