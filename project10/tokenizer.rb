class Tokens
	#nothing to init, why doesn't ruby allow use of just init instead od initialize?
	def initialize
	end
	#takes the in put file name and generates output and opens input for reading
	def tokenize(in_name) 
		in_file = File.new(in_name, "r");
		out_name = in_name.gsub /.jack$/, "Tgen.xml"
		out_file = File.new(out_name,"w")
		
		for i in in_file
			p i
		end

		#SHould always close even if it is done at program's terminations
		in_file.close() 
		out_file.close()
	end



end
























=begin
unless ARGV.size == 1
	puts "ERROR Expecting one argument got #{ARGV.size} arguments instead"
	exit
end

unless ARGV[0].match /\.jack$/ or File.directory?(ARGV[0])
	puts "Argument needs to be an .jack file"
	exit
end
unless File.directory?(ARGV[0])
	unless File.exists?(ARGV[0])
		puts "File #{ARGV[0]} doesn't seem to exit"
		exit
	end

	infile = File.new(ARGV[0],"r")
	out_name = ARGV[0].gsub /.jack$/, "Tgen.xml"
	outFile = File.new(out_name,"w")
	
	infile.close
	outFile.close
end

if File.directory?(ARGV[0])
	Dir.chdir(ARGV[0])
	Dir.foreach(".") do |file|
		if file.match /.jack$/
			out_name = file.gsub(/.jack$/, "Tgen.xml")
			outFile = File.new(out_name, "w")
			outFile.close();
		end
	end
end
=end

