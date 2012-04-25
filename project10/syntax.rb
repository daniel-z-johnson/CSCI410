require './tokenizer'

class Syntax
	def initialize
		@t = Tokens.new
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
				#p "de #{i}"
				next unless i.match %r!\*/!
				i.gsub! %r!.*\*/!, ''
				multi_line = false
			end
			
			if i.match %r!/\*!
				#p "re #{i}"
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
		#p @tokens
		compile_class
	end

	def compile_class
		@out_file.puts "<class>"
		@a = @tokens.shift
		until @a == '{'
			tok = @t.token_type(@a)
			write_toke tok, @a
			@a = @tokens.shift
		end
		tok = @t.token_type(@a)
		write_toke tok, @a
		@a = @tokens.shift
		while @a.match /static|field/
			compile_class_var_dec
		end
		while @a.match /constructor|function|method/
			compile_sub
		end
		unless @a == '{'
			puts "error expected } but got #{@a} instead"
		end
		@out_file.puts "</class>"
	end

	def compile_class_var_dec
		@out_file.puts "<classVarDec>"
		until @a == ';'
			tok = @t.token_type(@a)
			write_toke tok, @a
			@a = @tokens.shift
		end
		tok = @t.token_type(@a)
		write_toke tok, @a
		@a = @tokens.shift

		@out_file.puts "</classVarDec>"
	end

	def compile_sub
		@out_file.puts "<subroutineDec>"
			tok = @t.token_type @a
			write_toke tok, @a
			@a = @tokens.shift

			tok = @t.token_type @a
			write_toke tok, @a
			@a = @tokens.shift

			tok = @t.token_type @a
			write_toke tok, @a
			@a = @tokens.shift

			unless @a == '('
				puts "Expected ( got #{@a} instead"
			end
			tok = @t.token_type @a
			write_toke tok, @a
			@a = @tokens.shift
			compile_param_list


			tok = @t.token_type @a #end of param list ')'
			write_toke tok, @a
			@a = @tokens.shift

			#start of sub's body
			@out_file.puts "<subroutineBody>"
			unless @a == '{'
				puts "hello"
				puts "expected { got #{@a} instead"
			end
			tok = @t.token_type @a
			write_toke tok, @a
			@a = @tokens.shift


			while @a.match /var/
				compile_var_dec
			end

			@out_file.puts "<statements>"
			until @a.match %r!}!
				case @a
					when "do" then compile_do
					when "let" then compile_let
					when "if" then compile_if
					when "while" then compile_while
					when "return" then compile_return
					else puts "Do not reconize #{@a}"	
				end
			end
			@out_file.puts "<statements>"




		@out_file.puts "</subroutineDec>"
	end

	def compile_param_list
		@out_file.puts "<parameterList>"
		until @a == ')'
			tok = @t.token_type @a
			write_toke tok, @a
			@a = @tokens.shift
		end		
		@out_file.puts "</parameterList>"
	end

	def compile_var_dec
		@out_file.puts "<varDec>"
		until @a.match %r{;}
			tok = @t.token_type @a
			write_toke tok, @a
			@a = @tokens.shift
		end
		tok = @t.token_type @a
		write_toke tok, @a
		@a = @tokens.shift
		@out_file.puts "</varDec>"
	end

	def compile_statement
	end

	def compile_do
	end

	def compile_let
		@out_file.puts "<letStatement>"
		@out_file.puts "</letStatement>"
	end

	def compile_while
	end

	def compile_return
	end

	def compile_if
	end

	def compile_expression
	end

	def compile_term
	end

	def compile_expression_list
	end

	def write_toke(type, n)
		@out_file.puts "<#{type}> #{n}  </#{type}>"
	end
end