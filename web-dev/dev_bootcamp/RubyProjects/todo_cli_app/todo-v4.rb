require 'docopt' # Documentation helper
require 'rainbow' # Used for ANSI colorization

module Todo
  FILENAME = 'todo_list.txt'

  class List

    def initialize
      @todos = []
      @filename = FILENAME
      generate_list
    end

    def add(desc)
      @todos << Item.new(desc)
      puts "Todo added.".foreground(:green)
    end

    def prepend(desc)
      @todos.upshift(Item.new(desc))
    end

    def show
      puts header
      @todos.each.with_index do |todo, index|
        puts (index > 9 ? "#{index + 1}" : "0#{index + 1}") + " | "  \
          "#{todo.desc + ' '*(desc_col_width - todo.desc.length)} | " \
          "#{todo.complete? ? 'yes' : 'no '}  | " \
          "#{todo.created_at}"
      end
    end

    def delete(id)
      @todos.delete_at(id - 1)
      puts "Todo deleted.".background(:red)
      show
    end

    def complete(id)
      @todos[id - 1].complete!
    end

    # Helpers
    def header
      "ID   DESCRIPTION#{ ' '*(desc_col_width - 8) }DONE?  CREATED_AT"
    end

    def desc_col_width
      # Find char width of longest todo item
      @todos.length >= 2 ? @todos.map{ |t| t.desc }.group_by(&:size).max.first : 12
    end

  end

  class Item
    attr_reader :desc, :created_at

    def initialize(desc, params = {})
      @desc         = desc
      @created_at   = params[:created_at] || Time.now
      @completed    = params[:completed] == 'yes' ? true : false
    end

    def complete?
      @completed
    end

    def complete!
      @completed = true
    end
  end
  
  def parse_document
    File.open(FILENAME, 'r') do |f|
      f.lineno = 1
      f.each do |line|
        todo_arr = line.squeeze(' ').split('|')
        puts todo_arr
        todo = Item.new(todo_arr[1], :completed => todo_arr[2], :created_at => todo_arr[3])
        @todos << todo
        puts @todos.inspect
      end
    end
  end
  
  def write_document
    File.open(@filename, 'w+') do |f|
      f.puts header
      @todos.each.with_index do |todo, index|
        f.puts (index > 9 ? "#{index + 1}" : "0#{index + 1}") + " | "  \
          "#{todo.desc + ' '*(desc_col_width - todo.desc.length)} | " \
          "#{todo.complete? ? 'yes' : 'no '}  | " \
          "#{todo.created_at}"
      end
    end
  end

end

# SCRIPT
doc = "Usage: todo.rb command [options] <arg>

Commands:
  add <description>   Add a new todo
  show                Show all todos
  delete <id>         Delete todo
  complete <id>       Mark as completed

Options:
  -h --help           Show this
  -p --prepend        Add todo to start of list"

if __FILE__ == $0
  options = Docopt(doc, '1.0.0')  # parse options based on doc above
  command, argument = ARGV[0], ARGV[(1..-1)].join(' ') # extract command and argument
  list = Todo::List.new # create new list

  case command
  when 'add'
    if options[:p]
      list.prepend(argument)
    else
      list.add(argument)
    end
  when 'show'
    list.show
  when 'delete'
    list.delete(argument)
  when 'complete'
    list.complete(argument)
  else
    puts "Please enter a valid command."
  end

  # Write latest todos to file
  list.write_to_file
end
