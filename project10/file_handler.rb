require "./tokenizer"
require "./syntax"

tokenizer = Tokens.new
syntax = Syntax.new

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
	#puts "Hello"
	tokenizer.tokenize(ARGV[0])
	syntax.analize(ARGV[0])

end

if File.directory?(ARGV[0])
	Dir.chdir(ARGV[0])
	Dir.foreach(".") do |file|
		if file.match /.jack$/
			tokenizer.tokenize(file)
			syntax.analize(file)

		end
	end
end
