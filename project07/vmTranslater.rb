puts "Should have only one argument, note more less. One is the number"  unless ARGV.count == 1


def vm_file?(file)
	/.vm$/.match(file)
end

if File.directory?(ARGV[0])
	Dir.foreach(ARGV[0]) do |file|
		next unless vm_file?(file)
		puts "VM file found #{file}"
	end
elsif vm_file?(ARGV[0])
	puts "Found VM file #{ARGV[0]}"
else
	puts "Expecting a directory or a vm file, niuether were suplied"
end
		