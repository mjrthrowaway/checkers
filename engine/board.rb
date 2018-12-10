module Engine
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
    
    def move_piece(start_pos, end_pos, piece)
      set_piece(end_pos[0], end_pos[1], piece)
      remove_piece(start_pos[0], start_pos[1])
    end
    
    def set_piece(x,y,piece)
      raise 'invalid move' unless empty_position?(x,y) && in_range?(x,y)
      @grid[y][x] = piece
    end
    
    def remove_piece(x,y)
      @grid[y][x] = nil
    end
    
    # prob should not set to empty
    def return_piece(x,y)
      piece = @grid[y][x]
      piece ? piece : :empty
    end
    
    def empty_position?(x,y)
      return_piece(x,y) == :empty  
    end
    
    def in_range?(x,y)
      [x,y].all? {|coordinate| (0..SIZE-1).include?(coordinate)}
    end
    
    def empty_spaces
      find_element_coordinates_by_class(NilClass)
    end
    
    def full_spaces
      find_element_coordinates_by_class(Piece)
    end
    
    def find_element_coordinates_by_class(klass)
      empty_spaces = []
      @grid.each_with_index do |row, row_idx|
        row.each_with_index do |col, col_idx|
          empty_spaces << [row_idx, col_idx] if col.class == klass
        end
      end
      empty_spaces
    end
    
    private
    
    def setup_row(row, odd_row, color)
      (0...row.length).step(2).each do |index|
        position = odd_row ? index : index + 1
        row[position] =  Engine::Piece.new(color)
      end
    end
  end
end