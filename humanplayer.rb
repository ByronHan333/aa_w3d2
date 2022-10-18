class HumanPlayer
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def get_input
    puts "Input position..."
    pos = gets.chomp.split.map(&:to_i)
    pos
  end

  def receive_revealed_card(pos, value)
    nil
  end

  def receive_match(pos1, pos2)
    nil
  end
end