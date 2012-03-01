puts "Should have only one argument, note more less. One is the number"  unless ARGV.count == 1

def parser_stage(input)
	in_file = File.new(input, "r")
	output = input.gsub(/\.vm$/,".asm")
	out_file = File.new(output, "w")
end


def vm_file?(file)
	/.vm$/.match(file)
end

if File.directory?(ARGV[0])
	Dir.foreach(ARGV[0]) do |file|
		next unless vm_file?(file)
		puts "VM file found #{file}"
		parser_stage(ARGV[0] + file)

	end
elsif vm_file?(ARGV[0])
	begin
		in_file = File.new(ARGV[0], "r")
		in_file.close
	rescue
		puts "File #{ARGV[0]} does not exits"
		exit
	end
	parser_stage(ARGV[0])
	puts "Found VM file #{ARGV[0]}"
else
	puts "Expecting a directory or a vm file, niuether were suplied"
end


