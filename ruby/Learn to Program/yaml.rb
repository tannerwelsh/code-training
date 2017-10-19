require 'yaml'

test_array = [318, 'boldness', "Hard times \n are a comin'", ['new array', 'another value'], 3580/382]

test_string = test_array.to_yaml
# Kind of like "to_s", and it is in fact a string, but it's a YAML description of "test_array"

filename = 'TestYAML.txt'

File.open filename, 'w' do |f|
  f.write test_string
end

read_string = File.read filename

read_array = YAML::load read_string

puts(read_string == test_string)
puts(read_array == test_array)

puts(read_string)