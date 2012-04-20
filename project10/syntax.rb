require './tokenizer'

class Syntax
	def initialize
		t = Tokens.new
		@tokens = [] #will be like a queue
	end

	def analize(in_name)
		multi_line = false
		@in_file = File.new(in_name, "r");
		out_name = in_name.gsub /.jack$/, "_gen.xml"
		@out_file = File.new(out_name,"w")	
		for i in @in_file 
			i.gsub! %r!/\*.*\*/!, '' 
			if multi_line
				p "de #{i}"
				next unless i.match %r!\*/!
				i.gsub! %r!.*\*/!, ''
				multi_line = false
			end
			
			if i.match %r!/\*!
				p "re #{i}"
				i.gsub! %r!/\*.*!, ''
				multi_line = true
			end
			
			
			i.gsub! %r!//.*!, ''
			i.gsub! /(\{|\}|\(|\)|\[|\]|\.|,|;|\+|-|\*|\/|&|\||<|>|=|~)/, ' \1 '
			
			i.strip! 
			i.scan /\S+/ do |j|
				@tokens << j #forming queue
			end
		end
		p @tokens
	end

	def write_toke(type, n)
		@out_file.puts "<#{type}> #{n}  </#{type}>"
	end
end