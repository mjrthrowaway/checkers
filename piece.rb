class Piece
  attr_reader :color
  
  def initialize(color)
    @color = color
    @king = false
  end
  
  def king?
    @king
  end
  
  def promote
    @king = true
  end
end