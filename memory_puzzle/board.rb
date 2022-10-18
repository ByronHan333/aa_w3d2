require_relative 'card'

class Board
  def initialize(n=4)
    @size = n * n
    @board = Array.new(n) {Array.new(n)}
  end

  def [](pos)
    r, c = pos 
    @board[r][c]
  end

  def populate
    cards = ('A'..'Z').to_a.sample(8)
    cards += cards
    cards.shuffle! 
    (0...4).each do |r|
      (0...4).each do |c|
        @board[r][c] = Card.new(cards.pop)
      end
    end
  end

  def render
    puts("  0 1 2 3")
    @board.each_with_index do |row, i|
      print "#{i} "
      row.each{|c| print c.up ? "#{c.to_s} " : "  " }
      print "\n"
      # print "#{i} #{ row[0].up ?  } #{row[1].to_s if row[1].up } #{row[2].to_s if row[2].up }\n"
    end
  end

  def won?
    @board.all? do |row|
      row.all? {|c| c.up}
    end
  end

  def reveal(guessed_pos)
    card = self[guessed_pos]
    unless card.up
      card.reveal?
      return card.to_s
    end
  end


end