require_relative 'card'
require_relative 'board'
require_relative 'humanplayer'
require_relative 'computerplayer'


class Game

  attr_reader :board

  def initialize(name, is_human)
    @board = Board.new()
    @board.populate
    @previous_guess_pos = nil
    @player  = is_human ? HumanPlayer.new(name) : ComputerPlayer.new(name)
  end

  def make_guess(pos, player)
    if @previous_guess_pos 
      current_card = @board[pos]
      prev_car = @board[@previous_guess_pos]
      if current_card == prev_car 
        current_card.reveal?
        prev_car.reveal?
        player.receive_match(@previous_guess_pos, pos)
      else 
        current_card.hide
        prev_car.hide
      end
      @previous_guess_pos = nil 
    else 
      @previous_guess_pos = pos
      @board[pos].reveal?
    end
    player.receive_revealed_card(pos, current_card.to_s)
  end

  def play
    while true 
      @board.render
      pos = @player.get_input
      make_guess(pos, @player)
      @board.render
      sleep(2)
      system("clear")
      break if @board.won? 
    end

  end






end


