require 'parser'
require 'codewriter'

class File_handl
	attr_accessor :parser, :code_writer, :in_file
	def initialize(argv_in)
		if File.directory?(argv_in)
			given_dir = argv_in
			given_dir += "/" unless /\/$/.match  given_dir
			out_dir = given_dir + /\w*\/$/.match(given_dir).to_s.gsub(/\//,"") + ".asm"

			init_code_writer(out_dir)

			Dir.foreach(argv_in) do |file|


				next unless vm_file?(file)
				in_file = given_dir + file
				Parser.new(in_file, @code_writer)
			end
		elsif vm_file?(argv_in)
			begin
				argv_in
				in_file = argv_in
				init_code_writer(argv_in.gsub(/\.vm$/,".asm"))
				Parser.new(in_file, @code_writer)
				#in_file.close
			rescue => e
				puts e
				exit
			end
				
				puts "Found VM file #{argv_in}"
		else
			puts "Expecting a directory or a vm file, niether was suplied"
		end

	end


	def init_code_writer(file_name)
		@code_writer = Code_Writer.new(file_name)
	end

	def vm_file?(file)
		/.vm$/.match(file)
	end

end