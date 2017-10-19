require 'docopt' # Documentation helper
require 'rainbow' # Used for ANSI colorization

module Todo

  class List

    def initialize(filename = 'todo_list.txt')
      @todos = []
      @file = File.open(filename, 'w+')
    end

    def add(desc)
      @todos << Item.new(desc)
    end
    alias :append :add

    def prepend(desc)
      @todos.upshift(Item.new(desc))
    end

    def show
      @file.readlines do |line|
        puts line.background(:blue)
      end
    end

    def delete(id)
      @todos.delete_at(id - 1)
      puts "Todo deleted.".background(:red)
      self.show
    end

    def complete(id)
      @todos[id-1].complete!
    end

    def desc_col_width
      # Find char width of longest todo item
      @todos.sort{ |a,b| b.desc.length <=> a.desc.length }[0].desc.length
    end

    def write_to_file
      @todos.each.with_index do |todo, index|
        @file.puts (index > 9 ? "#{index + 1}" : "0#{index + 1}") + " | "  \
          "#{todo.desc + ' '*(desc_col_width - todo.desc.length)} | " \
          "#{todo.complete? ? 'yes' : 'no'}"
      end
    end

    def generate_header
      @file.puts "ID   DESCRIPTION #{ ' '*(desc_col_width - 12)}   COMPLETE?"
    end

  end

  class Item
    attr_reader :desc

    def initialize(desc)
      @desc         = desc
      @created_at   = Time.now
      @completed_at = nil
    end

    def complete?
      !@completed_at.nil?
    end

    def complete!
      @completed_at = Time.now
    end

  end

end


# SCRIPT
$list = Todo::List.new

# Factory
todos = ["Walk the dog", "Buy new clothes", "Do laundry", "Take a hike"]
todos.each do |todo|
  $list.add(todo)
end

# Display Todos
$list.write_to_file
$list.show