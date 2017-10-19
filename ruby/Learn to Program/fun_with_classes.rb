class Die
  
  def initialize
    roll
  end
  
  def roll
    @number_showing = 1 + rand(6)
  end
  
  def showing
    @number_showing
  end
  
  def cheat
    puts 'What numba you wanna show there, sonny?'
    while true
      num = gets.chomp.to_i
      if num <= 6 and num >= 1
        @number_showing = num
        break
      else
        puts 'It\'s gotta be between 1 and 6, y\'know.'
      end
    end
    @number_showing
  end
  
end

puts Die.new.cheat