class Cline
	attr_accessor :dest, :comp, :jump
	def initialize

		@dest = {
			nil    => '000',
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

		@comp = {
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
		# unless @jump.include[jjj]
		# 	puts "Incorrect jump code #{jjj}"
		# 	exit
		# end
		@jump[jjj]
	end

	def dest_bits(ddd)
		# unless @dest.include[ddd]
		# 	puts "Incorrect jump code #{ddd}"
		# 	exit
		# end
		@dest[ddd]
	end

	def comp_bits(comp_code)
		if /M/.match(comp_code)
			bit12 = "1"
		else
			bit12 = "0"
		end
		comp_code.gsub!(/M|A/,"Y") if comp_code
		# unless @comp.include[comp_code]
		# 	puts "Incorrect comp code #{comp_code}. An A or M will show as a Y"
		# 	exit
		# end
		p comp_code
		bit12 + @comp[comp_code]
	end

	def valid?(dest,comp,jump)
		comp.gsub!(/M|A/,"Y") if comp
		dest.gsub!(/\=/,'') if dest
		jump.gsub!(/;/,'') if jump
		return (@dest.has_key?(dest) and @comp.has_key?(comp) and @jump.has_key?(jump))
	end

end