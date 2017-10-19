# Chapter 14, Exercise 4

$tab = 0

def log desc, &block
  tabs = '  ' * $tab
  
  puts tabs + "Beginning #{desc.inspect}...\n"
  $tab += 1
  result = block[]
  $tab -= 1
  puts tabs + "...#{desc.inspect} finished, returning: \n" + tabs + "#{result}"
end

log 'outer block' do
  log 'some little block' do
    
    log 'teeny-tiny block' do
      'LOTS OF LOVE'.downcase
    end
    
    6*6 + 4*2
  end
  
  log 'yet another block' do
    '!doof naidnI evol I'.reverse
  end
  
  'O' == 0.to_s
end