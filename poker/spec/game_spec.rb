require "rspec"
require "game"
require "card"
require "hand"
require "deck"
require "player"
require "byebug"

describe Card do
    describe "#initialize" do
        subject(:card) { Card.new("queen", 5)}
        it "should have a suit" do
            
            expect(card.suit).to eq("queen")
        end

        it "should have a value" do
            expect(card.value).to eq(5)
        end
    end

end

describe Deck do
    describe "#initialize" do
        subject(:deck) {Deck.new}
        it "should have 52 cards" do
            expect(deck.deck.length).to eq(52)
        end

        it "should have 13 cards of a suit" do
            expect(deck.deck.select{|card| card.suit == :hearts }.length).to eq(13)
        end

        it "should have 4 cards of each value" do
            expect(deck.deck.select{|card| card.value == 1 }.length).to eq(4)
        end
    end

    describe "#shuffle!" do
        subject(:deck) {Deck.new}
        it "should have a working #shuffle! method" do
            old = deck.deck
            new = old.dup.shuffle!
            expect(new).not_to eq(old)
        end
    end
end


describe Hand do
    subject(:hand){Hand.new}
    describe "#initialize" do
        it "should be an instance of the hand class" do
        expect(hand).to be_an_instance_of(Hand)
        end
    end
    describe "#compare" do
    it "should compare to hand and return the hand that is higher ranked" do
        other_hand = Hand.new
        expect(hand.compare(other_hand))
    end

end