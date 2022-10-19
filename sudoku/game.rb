
require_relative 'board'

class Game
  def initialize(path)
    @board = Board.new(path)
  end

  def play
    while !@board.solved?
      @board.render
      pos,val = get_input
      @board.update_tile(pos, val)
    end
  end

  def manual_play
    pos, val = [0, 0], 4
    @board.update_tile(pos, val)
  end

  def get_input
    num = ('0'..'9').to_a
    puts "Enter a row, col, and value: "
    row, col, val = gets.chomp.split
    raise "not a number" if !num.include?(row) || !num.include?(col) || !num.include?(val)
    return [row.to_i, col.to_i], val.to_i
  rescue
    retry
  end
end
