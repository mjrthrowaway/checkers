require_relative 'piece'

RSpec.describe Engine::Piece do
  before do
    color = :black
    @piece = Engine::Piece.new(color)
  end
  
  it "should respond to color" do
    expect(@piece).to respond_to(:color)
  end
  
  it "should respond to king?" do
    expect(@piece).to respond_to(:king?)
  end
  
  it "should return black for color" do
    expect(@piece.color).to eq(:black)
  end
  
  it "should return false for is_king?" do
    expect(@piece.king?).to eq(false)
  end
  
  it "should be able to set king to true" do
    @piece.promote
    expect(@piece.king?).to eq(true)
  end
end