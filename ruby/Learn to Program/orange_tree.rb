class OrangeTree
  
  def initialize
    @age = 0
    @height = 0
    @num_oranges = 0
  end  
  
  def count_the_oranges
    if @num_oranges == 0
      puts 'There are no oranges right now.'
    else
      puts "There are #{@num_oranges} oranges on the tree."
    end
    
    one_year_passes
  end
  
  def pick_an_orange
    if @num_oranges == 0
      puts 'There are no oranges right now.'
    else
      @num_oranges -= 1
      puts 'Mmmm, juicy and delicious.'
    end
    
    one_year_passes
  end
  
  def measure_the_tree
    puts "The tree is #{@height} feet tall."
    
    one_year_passes
  end
  
  
  private
  
  def one_year_passes
    @age += 1
    if @height == 0 || @height == 1
      @height += 1
    else
      @height = (@height * 1.6).to_i
    end
    @num_oranges = 0
    if @age > 4
      @num_oranges = (@age * @age)
    end
    if @age == 12
      die
    end
  end
  
  def die
    puts 'The orange tree has died. It lived a good life.'
    exit
  end
  
end

tree = OrangeTree.new
tree.measure_the_tree
tree.count_the_oranges
tree.pick_an_orange
tree.pick_an_orange
tree.measure_the_tree
tree.count_the_oranges
tree.pick_an_orange
tree.count_the_oranges
tree.measure_the_tree
tree.measure_the_tree
tree.pick_an_orange
tree.pick_an_orange
tree.measure_the_tree
tree.measure_the_tree
tree.pick_an_orange
tree.count_the_oranges