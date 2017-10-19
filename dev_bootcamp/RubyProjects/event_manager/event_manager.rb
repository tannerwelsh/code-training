# Dependencies
require "csv"

# Class Definition
class EventManager
  INVALID_ZIPCODE = "00000"
  
  
  def initialize
    puts "EventManager Initialized."
    filename = "event_attendees.csv"
    @file = CSV.open(filename, {:headers => true, :header_converters => :symbol})
  end
  
  def output_data
    output = CSV.open("event_attendees_clean.csv", "w")
    @file.each do |line|
      output << line.headers if @file.lineno == 2 
      
      line[:homephone] = clean_phone(line[:homephone])
      line[:zipcode] = clean_zipcode(line[:zipcode])
      output << line
    end
  end
  
  def print_names
    @file.each do |line|
      puts line[:first_name] + " " + line[:last_name]
    end
  end
  
  def print_numbers
    @file.each do |line|
      number = clean_phone(line[:homephone])
      puts number
    end
  end
  
  def print_zipcodes
    @file.each do |line|
      zipcode = clean_zipcode(line[:zipcode])
      puts zipcode
    end
  end
  
  def clean_phone(original)
    original.delete!("-.() ")
    case original.length
    when 10
      original
    when 11 && original[0] == "1"
      original[1,10]
    else
      "0000000000"
    end
  end
  
  def clean_zipcode(zip)
    !zip.nil? ? zip = zip.insert(0,"0" * (5 - zip.length)) : INVALID_ZIPCODE
  end
  
end

# Script
manager = EventManager.new

manager.output_data