# Get file creation timestamp
filename = Dir['calc.rb']

timestamp = File.ctime(filename.to_s)