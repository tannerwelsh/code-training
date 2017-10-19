#!/usr/bin/env ruby
# -----------------
# 
# Command-Line Todo App
# =====================

# Documentation with docopt
require 'docopt'

doc = "Usage: todo.rb command [options] <argument>
	
Commands:
  add <name>      Add a new todo item
  list            Show list of all todos
  delete <id>     Delete a todo item
  complete <id>   Mark a todo item as complete

Options:
  -h --help       Show this.
  -i --important  Make todo high priority"

module Todo
  class List
  	attr_accessor :file
	
  	def initialize(filename)
  		if File.exists?(filename)
  			@file = File.open(filename, "w+")
  		else
  			@file = File.new(filename, "w+")
  		end
		
  	end
	
  	def add(todo)
  		@file << todo.text
  	end
    
    
    def write_to_file(filename)
      @file
    end
  end
  
  class Item
  	attr_accessor :text
	
  	def initialize(text)
  		# @id = new_id
  		@text = text
  		@complete = false
  	end
	
  end
end
# Component objects


if __FILE__ == $0
  options = Docopt(doc, '1.0.0')  # parse options based on doc above
	command, argument = ARGV[0].to_sym, ARGV[(1..-1)].join(" ")
end

# Script body
list = TodoList.new("todo_list.txt")
list.file.foreach do |line|
  puts line
end
 
case command
when :add
	todo = Todo.new(argument)
	p "New todo: " + todo.text
	list.add(todo)
when :list
end
