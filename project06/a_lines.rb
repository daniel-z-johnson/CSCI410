class Aline
	attr_accessor :mem_hash, :next_empty
	def initialize
		@next_empty = 16
		@mem_hash = Hash.new
		@mem_hash = {
			'R0'  =>  0,
			'R1'  =>  1,
			'R2'  =>  2,
			'R3'  =>  3,
			'R4'  =>  4,
			'R5'  =>  5,
			'R6'  =>  6,
			'R7'  =>  7,
			'R8'  =>  8,
			'R9'  =>  9,
			'R10' => 10,
			'R11' => 11,
			'R12' => 12,
			'R13' => 13,
			'R14' => 14,
			'R15' => 15,
			'SCREEN' => '16384', #looks bad here on but forgot about the other predefine symbols, bla
			'SP' => '0',
			'LCL' => '1',
			'ARG' => '2',
			'THIS' => '3',
			'THAT' => '4',
			'KBD' => '24576'
		}
	end

	#testing proof of concept
	def testHash(a)

		if @mem_hash.has_key?(a)
			puts @mem_hash[a]
		else
			@mem_hash[a] = @next_empty
			@next_empty += 1
		end
		@mem_hash[a]

	end

	def toBin(n)
	end

	#adds symbol that refers to memadress
	def addAddressSymbol(symbol, address)

		@mem_hash[symbol] = address

	end

	def instruction(asm)
		/@(\w*)/.match(asm.chomp)


	end



end
