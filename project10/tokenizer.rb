class Tokens
	# why doesn't ruby allow use of just init instead od initialize?
	def initialize
		@keyword = %w{class constructor function method field static var int char boolean void true false null this let do if else while return}
		@symbol = %w?{ } ( ) [ ] . , ; + - * / & | < > = ~?
	end
	#takes the in put file name and generates output and opens input for reading
	def tokenize(in_name) 
		multi_line = false
		@in_file = File.new(in_name, "r");
		out_name = in_name.gsub /.jack$/, "Tgen.xml"
		@out_file = File.new(out_name,"w")
		@out_file.puts "<tokens>"		
		for i in @in_file
			if i.match /\/\*/
				if  i.match /\*\//
					i.gsub! /\/\*.*\*\//, ''
				else
					i.gsub! /.*\*\//
					multi = true
				end
			end
			if multi_line
				next unless i.match /\*\//
				i.gsub! /.*\*\//
				multi = false
			end
			i.gsub! /\/\/.*/, ''
			i.gsub! /(\{|\}|\(|\)|\[|\]|\.|,|;|\+|-|\*|\/|&|\||<|>|=|~)/, ' \1 '
			p i
			i.strip! #ba chica wa wa
			i.scan /\S+/ do |j|
				type =  token_type j
				j.gsub! /&/, '&amp;'
				j.gsub! /"/, ''
				j.gsub! />/, '&gt;'
				j.gsub! /</, '&lt;'
				write_toke type, j
			end
		end

		@out_file.puts "</tokens>"		
		#SHould always close even if it is done at program's terminations
		@in_file.close() 
		@out_file.close()
	end

	def token_type(token)
		return "keyword" if @keyword.include? token
		return "symbol" if @symbol.include? token
		return "integerConstant" if token.match /^\d+$/
		return "stringConstant" if token.match /".*"/
		return "identifier" if token.match /([a-zA-Z]|_)([A-Za-z]|\d|_)*/
		puts token
		return "error"
	end

	def write_toke(type, n)
		@out_file.puts "<#{type}> #{n}  </#{type}>"
	end
=begin
	def int(n)
		write_toke "integerConstant", n
	end

	def stringConstant(s)
		write_toke "stringConstant", s
	end

	def identifier(i)
		write_toke "identifier", i
	end
	
	def keyword(k)
		write_toke "keyword", k
	end

	def symbol(s)
		write_toke "keyword", s
	end

	def error(e)
		puts "Something is wrong with #{e}"
	end
=end
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

