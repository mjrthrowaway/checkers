class Board
  require_relative 'Piece'
  
  SIZE = 8
  attr_accessor :grid  
  
  def initialize
    @grid = Array.new(SIZE) {Array.new(SIZE)}
  end
  
  def setup_board
    # should return board with Pieces on proper spaces
    @grid.each_with_index do |row, index|
      next if (3..4).include?(index)
      color = (0..2).include?(index) ? :white : :black 
      setup_row(row, index.odd?, color)
    end
  end
  
  private
  
  def setup_row(row, odd_row, color)
    (0...row.length).step(2).each do |index|
      position = odd_row ? index : index + 1
      row[position] =  Piece.new(color)
    end
  end
end