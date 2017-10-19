require 'rspec'

module Sudoku
  class Puzzle
    attr_reader :rows, :columns, :boxes
		attr_accessor :solution
    
    def initialize(unsolved)
			@solution = unsolved.to_s
			self.format
    end
    
    def format
			self.reset

      @solution.each_char.with_index do |char, cell|
        @rows[row_id(cell)][cell % 9] = char
        @columns[col_id(cell)][cell / 9] = char
        @boxes[box_id(cell)] << char
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
		
		# Solver helpers
		def neg_options(cell)
			(@rows[row_id(cell)] | 
			 @columns[col_id(cell)] | 
			 @boxes[box_id(cell)]) - ['0']
		end
		
		# The big kahuna
		def solve
			while @solution.include?('0')
				@solution.each_char.with_index do |char, cell|
					next if char != "0" || neg_options(cell).length < 8
					@solution[cell] = ('1'..'9').to_a.select{ |n| !neg_options(cell).include?(n) }[0]
					self.format
				end
			end
			return @solution
		end
		
		def really_solved?
			self.format
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
		
  end
end

# RUNTIME
input = ARGV[0].dup
puzzle = Sudoku::Puzzle.new(input)
puts puzzle.solve
puts "Solved: #{puzzle.really_solved?.to_s.upcase}"



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
