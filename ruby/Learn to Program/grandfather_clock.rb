def hourly &block
  hour = Time.now.hour
  
  if hour == 0
    hour = 12
  elsif hour > 12
    hour = hour - 12
  end
  
  hour.times do
    yield
  end
end

hourly do
  puts 'DONG!'
end