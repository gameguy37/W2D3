require "rspec"
require "tdd"

describe "#my_uniq" do
    subject(:original) {[2, 2, 1, 3, 2, 3, 1]}
    it "should return a new array" do
        new = original.my_uniq 
        expect(new).not_to be(original)
    end
    
    it "should return an array with no duplicates" do
        new = original.my_uniq
        hash = Hash.new(0)
        new.each { |ele| hash[ele] += 1 }
        expect(hash.all? { |_, v| v == 1 }).to be true
    end

    it "elements in the order in which they first appeared" do
        new = original.my_uniq
        expect(new).to eq([2, 1, 3])
    end
end

describe "#two_sum" do
    subject(:original) {[-2, 2, 1, -3, 4, 3, -1]}
    let(:new) { original.two_sum }
    it "should return a 2-D array" do
        expect(new.all? { |ele| ele.is_a?(Array) }).to be true
    end

    it "should populate with indices whose corresponding elements sum to 0" do
        expect(new.all? { |ele| original[ele[0]] + original[ele[1]] == 0 }).to be true
    end

    it "should order pairs 'dic-wise'" do
        expect(new).to eq([[0,1], [2,6], [3,5]])
    end

end

describe "#my_transpose" do
    subject(:original) {[[1,2,3], [4,5,6], [7,8,9]]}
    let(:new) { original.my_transpose }
    it "should return a 2-D array" do
        expect(new.all? { |ele| ele.is_a?(Array) }).to be true
    end

    it "should convert between row-oriented and column-oriented representations" do
        expect(new).to eq([[1,4,7], [2,5,8], [3,6,9]])
    end
end

describe "#stock_picker" do
    subject(:stocks) {[3.67, 4.23, 2.35, 2.45, 4.36, 5.76, 4.65, 1.34]} #indices 2 and 5
    let(:new) {stocks.stock_picker}
    it "should pick the most profitable buy sell date indices combo" do 
        expect(new).to eq([2,5])
    end
    it "sell date should not come before buy date" do
    expect(new[0] < new[1]).to be true
    end
end

describe "Towers_of_Hanoi" do
    subject(:game) { Towers.new }

    it "should #initialize as an instance of the 'Towers' class" do
        expect(game).to be_an_instance_of(Towers)
    end

    it "should check that #move works as expected for legal moves" do
        game.move([1,2])
        expect(game.T2).to eq([1])
    end

    it "should check that invalid #moves raise an error" do
        game.move([1,2])
        expect { game.move([1,2]) }.to raise(LargeAtopSmallError)
    end
    
    it "should declare the game #won? when either Tower2 or Tower3 contain all discs in numerical order" do
        game.cheat
        expect(game.won?).to be true
    end
end
