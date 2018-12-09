require_relative 'game'
require_relative 'board'
require_relative 'piece'

RSpec.describe Game do
  before do
    @game =  Game.new
  end
  
  it "instantiates a new game" do
    expect(@game.turn).to eq(:black)
    expect(@game.board).to eq(@game.board)
    expect(@game.finished?).to eq(false)
  end
  
  it "returns invalid move if trying to move another players piece" do
    expect(@game.validate_move?([0,1], [2,2])).to eq(false)
  end
  
  it "returns invalid move if trying to move an empty piece" do
    expect(@game.validate_move?([0,0], [2,2])).to eq(false)
  end
  
  
  it "returns invalid move if moving black piece backwards" do
    expect(@game.validate_move?([5,0], [4,1])).to eq(false)
  end
  
  it "returns invalid move if moving white piece backwards" do
    expect(@game.validate_move?([1,4], [0,3])).to eq(false)
  end
  
  it "returns invalid move if white piece is moving more than one column" do
    expect(@game.validate_move?([1,4], [3,4])).to eq(false)
  end
  
  it "returns invalid move if black piece is moving more than one column" do
    expect(@game.validate_move?([5,0], [3,4])).to eq(false)
  end
  
  it "returns invalid move if black piece moves more than one row" do
    expect(@game.validate_move?([5,0], [5,2])).to eq(false)
  end
  
  it "returns invalid move if white piece moves more than one row" do
    expect(@game.validate_move?([1,4], [1,6])).to eq(false)
  end
  
  it "returns invalid move if black moves forward one row to empty space" do
    expect(@game.validate_move?([5,0], [4,0])).to eq(false)
  end
  
  it "returns invalid move if black moves diagonal one row and one column to empty space" do
    expect(@game.validate_move?([0,5], [1,4])).to eq(true)
  end
end
