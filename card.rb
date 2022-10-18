

class Card
  attr_reader :up

  def initialize(face_val)
    @face_val = face_val
    @up = false
  end

  def hide
    @up = false if @up 
  end

  def reveal?
    @up = true unless @up
  end

  def to_s
    @face_val
  end

  def ==(card)
    @face_val == card.to_s
  end


end