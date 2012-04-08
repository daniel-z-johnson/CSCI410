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
		p File.basename file
		if file.match /.jack$/
			out_name = file.gsub(/.jack$/, "Tgen.xml")
			outFile = File.new(out_name, "w")
			outFile.close();
		end
	end
end
