# Open up the class Array and have it use a module Anagram
# Create the @word_dict instance variable as an empty hash
# Create a getter method for @word_dict, and an anagrams method that takes an array of words and returns an array of arrays

module Anagram
  @word_dict = {}
  attr_reader :word_dict
  
  def anagrams
    results = self.map { |w| [w] }
          
    self.map do |word|
      @word_dict.keys.each do |key|
        if word.split('').sort == key.split('').sort
          @word_dict[key] << word
        else
          @word_dict[word] = [word]
        end
      end
    end
  end
end

class Array
  include Anagram
end

require 'rspec'

describe Anagram do
  before do
    class Array
      include Anagram
    end
  end
  
  it "has an anagrams method" do
    Array.new.should respond_to(:anagrams)
  end
  
  it "has a getter method for word_dict" do
    Array.new.should respond_to(:word_dict)
  end
end
 
describe "anagrams" do
  before do
    WORDS = ['cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams', 'scream']
  end
  
  it "should sort words by anagrams" do
    WORDS.anagrams.map! { |agrams| agrams.sort }.sort.should eq([["cars", "racs", "scar"], ["creams", "scream"],
                                                      ["for"], ["four"], ["potatoes"]])
  end
  
  it "should use a hash" do
    WORDS.anagrams
    WORDS.word_dict.values.map! { |agrams| agrams.sort }.sort.should eq([["cars", "racs", "scar"], ["creams", "scream"], 
                                                                         ["for"], ["four"], ["potatoes"]] )
  end
end