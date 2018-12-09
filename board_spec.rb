require_relative 'board'
require 'pry'

RSpec.describe Board do
  before do
    @board = Board.new
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
  end
  
  private
  
  def correct_dimensions?(board, row, column)
    board.all? {|sub| sub.class == Array && sub.length == row} && board.count == column
  end
  
end