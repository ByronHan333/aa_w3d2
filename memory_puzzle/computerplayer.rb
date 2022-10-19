class ComputerPlayer
  attr_accessor :name, :known_cards, :matched_cards, :matched_values
  def initialize(name)
    @name = name
    @known_cards = Hash.new{|h,k| h[k] = []}
    @matched_cards = []
    @matched_values = []
  end

  def good_move
    @known_cards.keys.each do |arr|
    end
  end

  def get_input
    puts "Input position..."
    pos = []

    known_kv = known_cards.select {|k,v| v.length == 2}

    loop do
      if known_kv.length == 0
        r = rand(0...4)
        c = rand(0...4)
        pos = [r,c]
        break if !@matched_cards.include?(pos) 
      else
        # puts known_kv.values
        pos = known_kv.values.sample
        break if !@matched_cards.include?(pos)
      end
    end
    pos
  end

  def receive_revealed_card(pos, value)
    known_cards[value] << pos 
    puts known_cards
  end

  def receive_match(pos1, pos2, face_val)
    matched_cards.push(pos1, pos2)
    matched_values << face_val
    known_cards.delete(face_val)
  end

end