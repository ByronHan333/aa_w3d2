require_relative "tile"
require "set"

class Board

  def self.from_file(path)
    array = File.readlines(path)
    chompped = array.map do |row|
      row.chomp.split("").map(&:to_i)
    end
    chompped.map do |row|
      row.map {|ele| Tile.new(ele)}
    end 

  end

  def []=(pos,val)
    row, col = pos
    @board[row][col] = Tile.new(val)
  end

  def [](pos)
    row, col = pos
    @board[row][col]
  end


  def initialize(path)
    @board = Board.from_file(path)
  end

  def update_tile(pos, val)
    self[pos] = val
  end

  def render 
    @board.each do |row|
      row.each { |ele| print "#{ele.to_s}"}
      print "\n"
    end
  end

  def solved?
    solved_col? && solved_row? && solved_sub?
  end

  def solved_row?
    set_match = Set.new((1..9).to_a)
    #checks each row
    @board.all? do |row|
      temp_row = []
      row.each {|ele| temp_row << ele.to_s}
      temp_row.to_set == set_match
    end
  end

  def solved_col?
    set_match = Set.new((1..9).to_a)
    (0...9).all? do |idx|
      temp = Set[]
      @board.each {|row| temp << row[idx].to_s}
      temp == set_match
    end
  end

  def box_check(r,c)
    temp = Set[]
    set_match = Set.new((1..9).to_a)
    (0...3).each do |row_increment|
      (0...3).each do |col_increment|
        pos = [r+row_increment,c+col_increment]
        temp << self[pos].to_s
      end
    end
    temp == set_match
  end

  def solved_sub?
    start_idxs = [0,3,6]

    start_idxs.all? do |row_start|
      start_idxs.all? do |col_start|
        box_check(row_start,col_start)
      end
    end
  end

end

# path = "sudoku1_solved.txt"
# b = Board.new(path)
# b.render
# p b.solved?
# #  p b.solved_col?
# # #p b.solved_row?
# # p b.solved_sub?
