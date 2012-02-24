class Cline
	attr_accessor :dest, :op, :jump
	def ininialize

		@dest = {
			'nil'  => '000',
			'M'    => '001',
			'D'    => '010',
			'A'    => '100',
			'MD'   => '011',
			'AM'   => '101',
			'AD'   => '110',
			'AMD'  => '111'
		}

		@jump = {
			nil   => '000',
			'JGT' => '001',
			'JEQ' => '010',
			'JGE' => '011',
			'JLT' => '100',
			'JNE' => '101',
			'JLE' => '110',
			'JMP' => '111'
		}

		@op = {
			nil   => '000000',
			'0'   => '101010',
			'1'   => '111111',
			'-1'  => '111010',
			'D'   => '001100',
			'Y'   => '110000',
			'!D'  => '001101',
			'!Y'  => '110001',
			'-D'  => '001111',
			'-Y'  => '110011',
			'D+1' => '011111',
			'Y+1' => '110111',
			'D-1' => '001110',
			'Y-1' => '110010',
			'D+Y' => '000010',
			'D-Y' => '010011',
			'Y-D' => '000111',
			'D&Y' => '000000',
			'D|Y' => '010101'
		} #same bits for instruction that can be A or M will take care of A or M in method
		#being lazy is awesome
	end

	def jump_bits(jjj)
		@jump[jjj]

	def dest_bits(ddd)
		@dest[ddd]
	end

	def op_bits(op_code)
		if op_bits.index(/M/)
			bit12 = "1"
		else
			bit12 = "0"
		end
		op_code.gub!(/M|A/,"Y")
		bit12 + @op[op_code]
	end


	def gen_instruction(asm)
		/([AMD]{0,3})=/.match(asm)
		dest3 = @dest[$1] || '000' #get the dest code or if nill sets it to 000
		#/(J[GTEQNL]{2})/

	end
end