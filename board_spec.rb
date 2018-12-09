require_relative 'board'
require 'pry'

RSpec.describe Board do
  before do
    @board = Board.new
    @board.setup_board
  end
  
  it "should instantiate an 8x8 board" do
    expect(correct_dimensions?(@board.grid, 8, 8)).to eq (true)
  end
  
  it "should fail if board is not 8x8" do
    stub_const('Board::SIZE', 9)
    @board = Board.new
    expect(correct_dimensions?(@board.grid, 8, 8)).to eq (false)
  end
  
  it "should setup board pieces correctly" do
    @board.setup_board
    # Row one
    expect(@board.grid[0][0]).to eq(nil)
    expect(@board.grid[0][1].color).to eq(:white)
    expect(@board.grid[0][1].king?).to eq(false)
    expect(@board.grid[0][2]).to eq(nil)
    expect(@board.grid[0][3].color).to eq(:white)
    expect(@board.grid[0][3].king?).to eq(false)
    expect(@board.grid[0][4]).to eq(nil)
    expect(@board.grid[0][5].color).to eq(:white)
    expect(@board.grid[0][5].king?).to eq(false)
    expect(@board.grid[0][6]).to eq(nil)
    expect(@board.grid[0][7].color).to eq(:white)
    expect(@board.grid[0][7].king?).to eq(false)
    
    # Row two
    expect(@board.grid[1][0].color).to eq(:white)
    expect(@board.grid[1][0].king?).to eq(false)
    expect(@board.grid[1][1]).to eq(nil)
    expect(@board.grid[1][2].color).to eq(:white)
    expect(@board.grid[1][2].king?).to eq(false)
    expect(@board.grid[1][3]).to eq(nil)
    expect(@board.grid[1][4].color).to eq(:white)
    expect(@board.grid[1][4].king?).to eq(false)
    expect(@board.grid[1][5]).to eq(nil)
    expect(@board.grid[1][6].color).to eq(:white)
    expect(@board.grid[1][6].king?).to eq(false)
    
    # Row three
    expect(@board.grid[2][0]).to eq(nil)
    expect(@board.grid[2][1].color).to eq(:white)
    expect(@board.grid[2][1].king?).to eq(false)
    expect(@board.grid[2][2]).to eq(nil)
    expect(@board.grid[2][3].color).to eq(:white)
    expect(@board.grid[2][3].king?).to eq(false)
    expect(@board.grid[2][4]).to eq(nil)
    expect(@board.grid[2][5].color).to eq(:white)
    expect(@board.grid[2][5].king?).to eq(false)
    expect(@board.grid[2][6]).to eq(nil)
    expect(@board.grid[2][7].color).to eq(:white)
    expect(@board.grid[2][7].king?).to eq(false)
    
    # Row four
    (1..7).each do |index|
      expect(@board.grid[3][index]).to eq(nil)
    end
    
    # Row five
    (1..7).each do |index|
      expect(@board.grid[4][index]).to eq(nil)
    end
    
    # Row six
    expect(@board.grid[5][0].color).to eq(:black)
    expect(@board.grid[5][0].king?).to eq(false)
    expect(@board.grid[5][1]).to eq(nil)
    expect(@board.grid[5][2].color).to eq(:black)
    expect(@board.grid[5][2].king?).to eq(false)
    expect(@board.grid[5][3]).to eq(nil)
    expect(@board.grid[5][4].color).to eq(:black)
    expect(@board.grid[5][4].king?).to eq(false)
    expect(@board.grid[5][5]).to eq(nil)
    expect(@board.grid[5][6].color).to eq(:black)
    expect(@board.grid[5][6].king?).to eq(false)
 
    # Row seven
    expect(@board.grid[6][0]).to eq(nil)
    expect(@board.grid[6][1].color).to eq(:black)
    expect(@board.grid[6][1].king?).to eq(false)
    expect(@board.grid[6][2]).to eq(nil)
    expect(@board.grid[6][3].color).to eq(:black)
    expect(@board.grid[6][3].king?).to eq(false)
    expect(@board.grid[6][4]).to eq(nil)
    expect(@board.grid[6][5].color).to eq(:black)
    expect(@board.grid[6][5].king?).to eq(false)
    expect(@board.grid[6][6]).to eq(nil)
    expect(@board.grid[6][7].color).to eq(:black)
    expect(@board.grid[6][7].king?).to eq(false)
    
    # Row eight
    expect(@board.grid[7][0].color).to eq(:black)
    expect(@board.grid[7][0].king?).to eq(false)
    expect(@board.grid[7][1]).to eq(nil)
    expect(@board.grid[7][2].color).to eq(:black)
    expect(@board.grid[7][2].king?).to eq(false)
    expect(@board.grid[7][3]).to eq(nil)
    expect(@board.grid[7][4].color).to eq(:black)
    expect(@board.grid[7][4].king?).to eq(false)
    expect(@board.grid[7][5]).to eq(nil)
    expect(@board.grid[7][6].color).to eq(:black)
    expect(@board.grid[7][6].king?).to eq(false)
  end
  
  it "should return the piece on the given coordinates" do
    expect(@board.return_piece(3,2).color).to eq(:white)
    expect(@board.return_piece(3,2).king?).to eq(false)
  end
  
  it "should return nil if no piece on the given coordinates" do
    expect(@board.return_piece(2,2)).to eq(:empty)
  end
  
  it "should return true if position is empty" do
    expect(@board.empty_position?(2,2)).to eq(true)
  end
  
  it "should return that coordinates are in range if on board" do
    expect(@board.in_range?(3,3)).to eq(true)  
  end
  
  it "should return that coordinates are not in range if not on board" do
    expect(@board.in_range?(3,9)).to eq(false)  
  end

  it "should set a piece if space is empty" do
    piece = Piece.new(:white)
    @board.set_piece(2,2, piece)
    expect(@board.return_piece(2,2).color).to eq(:white)
  end
  
  it "should return error if trying to set piece where space is not empty" do
    piece = Piece.new(:white)
    expect{@board.set_piece(3,2,piece)}.to raise_error(RuntimeError)
  end
  
  it "should remove piece from square" do
    expect(@board.return_piece(3,2).color).to eq(:white)
    @board.remove_piece(3,2)
    expect(@board.return_piece(3,2)).to eq(:empty)
  end
  
  it "should move a piece on the board" do
    expect(@board.return_piece(3,2).color).to eq(:white)
    expect(@board.return_piece(4,2)).to eq(:empty)
    
    piece = @board.return_piece(3,2)
    @board.move_piece(([3,2]), ([4,2]), piece)   
    
    expect(@board.return_piece(4,2).object_id).to eq(piece.object_id)
    expect(@board.return_piece(3,2)).to eq(:empty)
  end
  
  it "should return an array of the coordinates of all empty spaces" do
    expect(@board.empty_spaces).to eq(empty_spaces_after_setup)
  end
  
  it "should return an array of the coordinates of all full spaces" do
    expect(@board.full_spaces).to eq(full_spaces_after_setup)
  end

  
  private
  
  def correct_dimensions?(board, row, column)
    board.all? {|sub| sub.class == Array && sub.length == row} && board.count == column
  end
  
  def empty_spaces_after_setup
    [[0, 0], [0, 2], [0, 4], [0, 6], [1, 1], [1, 3], [1, 5], [1, 7], [2, 0], [2, 2], [2, 4], [2, 6], [3, 0], [3, 1], [3, 2], [3, 3], [3, 4], [3, 5], [3, 6], [3, 7], [4, 0], [4, 1], [4, 2], [4, 3], [4, 4], [4, 5], [4, 6], [4, 7], [5, 1], [5, 3], [5, 5], [5, 7], [6, 0], [6, 2], [6, 4], [6, 6], [7, 1], [7, 3], [7, 5], [7, 7]]
  end
  
  def full_spaces_after_setup
    [[0, 1], [0, 3], [0, 5], [0, 7], [1, 0], [1, 2], [1, 4], [1, 6], [2, 1], [2, 3], [2, 5], [2, 7], [5, 0], [5, 2], [5, 4], [5, 6], [6, 1], [6, 3], [6, 5], [6, 7], [7, 0], [7, 2], [7, 4], [7, 6]]
  end
end