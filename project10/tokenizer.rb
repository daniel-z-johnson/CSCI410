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
	out_name = File.basename(ARGV[0]).gsub /\.jack$/, "T.xml"
	out_name = "tokinized_files/" + out_name
	outFile = File.new(out_name,"w")
	for i in infile
		outFile.write i
	end
	
	infile.close
	outFile.close
end

Dir.foreach(ARGV[0]) do |file|
	p file
end
