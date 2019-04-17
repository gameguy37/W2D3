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
        #new = original.two_sum
        expect(new.all? { |ele| ele.is_a?(Array) }).to be true
    end

    it "should populate with indices whose corresponding elements sum to 0" do
        #new = original.two_sum
        expect(new.all? { |ele| original[ele[0]] + original[ele[1]] == 0 }).to be true
    end

    it "should order pairs 'dic-wise'" do
        #new = original.two_sum
        expect(new).to eq([[0,1], [2,6], [3,5]])
    end

end

describe "#my_transpose" do
    subject(:original) {[[1,2,3], [4,5,6], [7,8,9]]}
    let(:new) { original.my_transpose }
    it "should return a 2-D array" do
        #new = original.my_transpose
        expect(new.all? { |ele| ele.is_a?(Array) }).to be true
    end

    it "should convert between row-oriented and column-oriented representations" do
        #new = original.my_transpose
        expect(new).to eq([[1,4,7], [2,5,8], [3,6,9]])
    end
end

