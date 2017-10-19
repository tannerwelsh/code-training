# Start by changing the directory to the destination folder
dest_dir = '/Users/tannerwelsh/Pictures/Road Trip 2010/'
batch_name = 'RoadTrip2010'

unless File.directory?(dest_dir)
  Dir.mkdir(dest_dir)
end

Dir.chdir(dest_dir)

# Find all the files to be renamed
source_files = Dir['/Users/tannerwelsh/Pictures/Road Trip \'10!/*.{JPG,jpg}']

pic_number = 1

# Loop through each file, and change its name to move it to the destination directory
source_files.each do |name|
  print '.' # Progress bar
  
  new_name = if pic_number < 10
    "#{batch_name}-00#{pic_number}.jpg"
  elsif pic_number < 100 and pic_number >= 10
    "#{batch_name}-0#{pic_number}.jpg"
  else
    "#{batch_name}-#{pic_number}.jpg"
  end
  
  unless File.exist?(new_name)
    File.rename name, new_name
  end
  
  pic_number = pic_number + 1
end

puts
puts 'Process complete.'