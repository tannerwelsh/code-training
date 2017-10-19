class List
  def initialize
    
  end
end

class Item
  def initialize(desc)
    @description = desc
    @created_at = Time.now
    @completed_at = nil
  end
  
  attr_writer :description
  # def description=(desc)
  #   @description = desc
  # end

  def new_desc
    @description = "adspfaoisdnfa"
  end
  
end

new_todo = Item.new("walk the dog")
new_todo.new_method

new_todo.description = "Buy milk"
new_todo.new_method

