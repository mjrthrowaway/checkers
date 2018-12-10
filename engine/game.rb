  module Engine
  class Game
    require_relative 'board'
    require_relative 'piece'
    require 'pry'
    
    attr_reader :board, :turn
    def initialize
      @board = Board.new
      @board.setup_board
      @turn = :black
      @finished = false
    end
    
    def finished?
      @finished
    end
    
    def play_turn(from, to)
      perform_move(from,to)
    end
    
    def next_turn
      @turn == :white ? :black : :white
    end
    
    def validate_pawn_move?(from, to)
      valid_move = true
      return valid_move = false unless from_piece_belongs_to_current_player(from)
      return valid_move = false unless move_forward_within_one_row?(from, to)
      return valid_move = false unless move_within_one_column?(from, to)
      return valid_move = false unless diagonal_move(from, to)
      valid_move
    end
    
    def from_piece_belongs_to_current_player(from)
      return false if @board.empty_position?(from[0], from[1])
      @turn == @board.return_piece(from[0], from[1]).color  
    end
    
    # need to check for jumps first
    def move_forward_within_one_row?(from, to)
      piece = @board.return_piece(from[0], from[1])    
      if piece.color == :white
        from[1] + 1 == to[1]  
      else
        from[1] - 1 == to[1]
      end
    end
    
    def move_within_one_column?(from, to)
      (from[0] - to[0]).abs < 2
    end
    
    def diagonal_move(from, to)
      from[1] != to[1] && from[0] != to[0]
    end
  end
end