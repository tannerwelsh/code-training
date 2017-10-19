# Define a method that can be called on a string and takes another string as its sole argument. It should concatenate the two strings and permanently modify the string it is called on.
class String
  def new_concat(arg)
    self << arg.to_s
  end
end

a = "foo"
a.new_concat(8123)
puts a

# If the argument passed is an array, capitalize the first letter of all elements in the array and concatenate them all with the string the method is called on.
class String
  def new_concat(arg)
    if arg.class == Array
      self << arg.map{ |word| word.capitalize! }.join('')
    else
      self << arg.to_s
    end
  end
end

b = "foo"
b.new_concat(['bar','baz','qux'])
puts b


# If the string this method is called on is less than ten letters and the first letter is not already capitalized, then capitalize the first letter before concatenation. If the string that this method is called on is over ten letters or is equal to the string “omgthisiscrazy”, capitalize every other letter of the string before concatenation.
class String
  def new_concat(arg)
    if self.length < 10 && self[0] == self[0].downcase
      self.capitalize!
    elsif self.length >= 10 || self == 'omgthisiscrazy'
      self.each_char.with_index do |char, index|
        self[index] = char.capitalize if index.even?
      end
    end
    
    if arg.class == Array
      self << arg.map{ |word| word.capitalize! }.join('')
    else
      self << arg.to_s
    end
  end
end

c = "shorty"
c.new_concat(['bar','baz','qux'])
puts c

d = "omgthisiscrazy"
d.new_concat('right?')
puts d

# Money conversion object.  Instantiate an object that will take a hash like this one ({:country => :australia, :value => 22.00}) and output a string declaring the value in dollars.  Include some non native time module that provides the date in a reasonable format like 'chronic'.  The output string should read something like: "#{original_amount} in #{location} converted to us dollars at #{time.now} is #{value}"
# Money conversion object. Define a Converter class that you can instantiate with options in hash form like this: Converter.new(:country => :australia, :value => 8128). :country should contain a country name, and value should be the amount to be converted in integer form (i.e. no floats!). The output string should read something like: "#{original_amount} in #{location} converted to us dollars at #{time.now} is #{value}"

require 'money'
require 'money/bank/google_currency'
require 'iso_country_codes'
# set default bank to instance of GoogleCurrency
Money.default_bank = Money::Bank::GoogleCurrency.new

class Converter
  def initialize(params)
    @country = params[:country]
    currency = IsoCountryCodes.find(@country.to_s).currency
    @amt = Money.new(params[:value],currency)
  end
  
  def to_dollars
    "#{@amt} in #{@country.to_s.capitalize} converted to US dollars at #{Time.now} is $#{@amt.exchange_to(:USD)}."
  end
end

a = Converter.new(:country => :china, :value => 12418)
puts a.to_dollars


# puts 123.to_money(:USD).exchange_to(:EUR)