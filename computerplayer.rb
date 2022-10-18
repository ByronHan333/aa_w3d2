class ComputerPlayer
  attr_reader :name, :known_cards, :matched_cards
  def initialize(name)
    @name = name
    @known_cards = Hash.new{|h,k| h[k] = []}
    @matched_cards = []
  end

  def good_move
    @known_cards.keys.each do |arr|
    end
  end

  def get_input
    puts "Input position..."
    pos = []
    loop do
      r = rand(0...4)
      c = rand(0...4)
      pos = [r,c]
      break if !@matched_cards.include?(pos) 
    end
    pos
  end

  def receive_revealed_card(pos, value)
    known_cards[value] << pos 
  end

  def receive_match(pos1, pos2)
    matched_cards.push(pos1, pos2)
  end

end