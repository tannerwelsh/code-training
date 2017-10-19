require 'rspec'

module Sudoku
    
  class Puzzle
    attr_reader :rows, :columns, :boxes
		attr_accessor :board
    
    def initialize(board)
			@board = board.split(//)
			self.format
    end
    
    def format
			self.reset

      @board.each.with_index do |value, cell|
        @rows[row_id(cell)][cell % 9] = value
        @columns[col_id(cell)][cell / 9] = value
        @boxes[box_id(cell)] << value
      end
		end
		
		def reset
			@rows, @columns, @boxes = [], [], []
			9.times { @rows << []; @columns << []; @boxes << [] }
		end
		
		# Locator helpers
		def row_id(cell)
			cell / 9
		end

		def col_id(cell)
			cell % 9
		end

		def box_id(cell)
			((row_id(cell) / 3) * 3) + (col_id(cell) / 3)
		end
    
    def group(cell)
      [@rows[row_id(cell)], @columns[col_id(cell)], @boxes[box_id(cell)]]
    end
		
		# Solver helpers
		def options(cell)
			('1'..'9').to_a - neg_options(cell)
    end
    
    def neg_options(cell)
      group(cell).inject { |a, b| a | b } - ['0']
		end
		
  end
  
  class Solver
    attr_reader :solution
    
    def initialize(puzzle)
      @puz = puzzle
    end
    
    def try_options(cell)
      @puz.group[cell].each do |option|
        @puz.group(cell).each do |rowcolbox|
          return @puz.board[cell] = option if rowcolbox.flatten.count(option) == 1
        end
      end
    end
    		
  	def really_solved?
  		@puz.format
  		@rows.each do |row|
  			return false unless row.sort == ('1'..'9').to_a 
  		end
  		@columns.each do |col|
  			return false unless col.sort == ('1'..'9').to_a 
  		end
  		@boxes.each do |box|
  			return false unless box.sort == ('1'..'9').to_a 
  		end
  		true
  	end
  
    def build_option_arrays
      @puz.each.with_index do |value, cell|
        next if value != '0'
        potentials = options(cell)
        @puz[cell] = (possibles.length > 1 ? potentials : potentials[0])
      end
      self.format
    end
  
    
    def solve_for_cell(cell = 0)
      # return @puz if really_solved?
      # Skip this cell if it is a string
      cell == 80 ? next_cell = 0 : next_cell = cell + 1
      solve(next cell) if @puz[cell].is_a?(String)
      try_options(cell)
      solve(cell+1)
      
  		@puz.each.with_index do |value, cell|
  			next if value != '0' # || neg_options(cell).length < 8
          
  			@puz[cell] = ('1'..'9').to_a.select{ |n| !neg_options(cell).include?(n) }[0]
  			self.format
  		end
    end
    
    # The big kahuna
    def solve_puzzle
      # Start off by building all of the arrays of options
      build_option_arrays if @puz.board.include?('0')
      
    end
    
  end
  
end

class Array
  # Strip an array of all non-matching data types
  # e.g. isolate(String) to return array with only string valueents
  def isolate(data_type)
    self.keep_if { |e| e.is_a?(data_type) }
  end
end


# RUNTIME
# input = ARGV[0].dup
input = '080020000040500320020309046600090004000640501134050700360004002407230600000700450'
@puzzle = Sudoku::Puzzle.new(input)
# puts puzzle.solve
# puts "Solved: #{puzzle.really_solved?.to_s.upcase}"



# SPECS
describe 'Sudoku' do
	  
  before(:each) do
    @puzzle = Sudoku::Puzzle.new('619030040270061008000047621486302079000014580031009060005720806320106057160400030')
  end

  describe 'formatting' do
        
    before(:each) do
      @puzzle.format
    end
    
    it 'formats the puzzle into rows' do
      @puzzle.rows.length.should eq(9)
    end
    
		it 'formats the puzzle into columns' do
      @puzzle.columns.length.should eq(9)
    end
		
		it 'formats the puzzle into boxes' do
      @puzzle.boxes.length.should eq(9)
    end
      
  end
  
  it 'takes a string as an argument and returns a solved string' do
    @puzzle.solve.should \
		 eq('619238745274561398853947621486352179792614583531879264945723816328196457167485932')
  end
end
