require 'parser'
require 'codewriter'

class File_handl
	attr_accessor :parser, :code_writer
	def initialize(argv_in)
		if File.directory?(argv_in)
			given_dir = argv_in
			given_dir += "/" unless /\/$/.match  given_dir
			given_dir += /\w*\/$/.match(given_dir).to_s.gsub(/\//,"") + ".asm"

			init_code_writer(given_dir)

			Dir.foreach(argv_in) do |file|


				next unless vm_file?(file)
				puts "VM file found #{file}"
			end
		elsif vm_file?(argv_in)
			begin
				p argv_in
				in_file = File.new(argv_in, "r")
				init_code_writer(argv_in.gsub(/\.vm$/,".asm"))
				in_file.close
			rescue => e
				puts e
				puts "File #{argv_in} does not exits"
				exit
			end
				
				puts "Found VM file #{argv_in}"
		else
			puts "Expecting a directory or a vm file, niether was suplied"
		end

	end

	def init_code_writer(file_name)
		@code_Writer = Code_Writer.new(file_name)
	end

	def vm_file?(file)
		/.vm$/.match(file)
	end

end