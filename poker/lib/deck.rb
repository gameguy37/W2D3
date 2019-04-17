require_relative "card"

class Deck
    attr_reader :deck
  
    SUITS = [:spades, :clubs, :hearts, :diamonds]
    VALUES = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]

    def initialize
        @deck= []
        populate_deck
    end

    def populate_deck
        SUITS.each do |suit|
            VALUES.each do |value|
                @deck << Card.new(suit, value)
            end
        end
    end

    def shuffle!
        @deck.shuffle!
    end

end