# Chapter 14, Exercise 3

def logger block_description, &block
  puts "BEGIN #{block_description}..."
  yield
  puts "END #{block_description}."
end

logger 'hour counter' do
  h = Time.new.hour
  
  logger 'minute counter' do
    m = Time.new.min
    
    puts "#{m} minutes"
  end
  
  puts "#{h} hours"
end