require 'FileHandle'
puts "Should have only one argument, note more less. One is the number"  unless ARGV.count == 1

f = File_handl.new(ARGV[0]) 
