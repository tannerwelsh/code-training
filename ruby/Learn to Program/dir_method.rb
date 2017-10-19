# Search for all files in the current directory that end in ".rb"
puts Dir['*.jpg']

# Search for all files that end in ".jpg" in the parent directory and all subdirectories (recursive search)
puts Dir['../**/*.jpg']

###

# Search home directory for files that end in .yml
Dir.chdir '/Users/tannerwelsh/'

yaml_files = Dir['**/*.yml']

# Create a status bar with "print" (like puts but doesn't move to next line)
yaml_files.each do
  print '.'
end

puts ''
puts  "Task complete.\n" + 
      "Here are your files:"

puts(yaml_files)