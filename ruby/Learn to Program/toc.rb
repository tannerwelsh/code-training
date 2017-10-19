contents = [[1, 'Getting Started', 1], [2, 'Numbers', 9], [3, 'Letters', 13]]

puts 'Table of Contents'.center(59)

contents.each do |item|
  chapter_no = 'Chapter ' + item[0].to_s + ':  '
  title = item[1].ljust(40)
  page = 'page' + item[2].to_s.rjust(3)
  
  puts chapter_no + title + page
end