require "byebug"

class Array
    def my_uniq
        hash = Hash.new(0)
        self.each { |ele| hash[ele] += 1 }
        hash.keys
    end

    def two_sum
        arr = []
        (0...self.length-1).each do |i|
            (i..self.length-1).each do |j|
                arr << [i,j] if self[i] + self[j] == 0
            end
        end
        arr
    end

    def my_transpose
        array = []
        self.length.times do |i|
            #debugger
            sub = [self[0][i]]
            (1..self.length-1).each do |j|
                #debugger
                sub << self[j][i]
            end
            array << sub
        end
        array
    end

    def stock_picker
        max = 0
        indicies = []
        self.each_with_index do |ele1, idx1|
            self.each_with_index do |ele2, idx2|
                if idx2 > idx1
                    if ele2 - ele1 > max #|| max.nil?
                    max = ele2 - ele1
                    indicies = [idx1, idx2]
                    end
                end
            end
        end
        indicies
    end

end

class LargeAtopSmallError < StandardError; end
class EmptyFromTowerError < StandardError; end

class Towers

    attr_reader :T1, :T2, :T3

    def initialize
        @T1 = [7,6,5,4,3,2,1]
        @T2 = []
        @T3 = []
    end

    def move(response)
        from_twr, to_twr = response
        #debugger
        case from_twr
        when 1
            raise EmptyFromTowerError if self.T1.empty?
            disc = self.T1.pop
        when 2
            raise EmptyFromTowerError if self.T2.empty?
            disc = self.T2.pop
        when 3
            raise EmptyFromTowerError if self.T3.empty?
            disc = self.T3.pop
        end
        
        case to_twr
        when 1
            raise LargeAtopSmallError if self.T1[-1] < disc
            self.T1.push(disc)
        when 2
            raise LargeAtopSmallError if self.T2[-1] < disc
            self.T2.push(disc)
        when 3
            raise LargeAtopSmallError if self.T3[-1] < disc
            self.T3.push(disc)
        end
    end

    def get_move
        valid = false
        response = []
        while !valid
            puts "Please enter a tower to move from and a tower to move to separated by a comma (e.g., 1,3)"
            response = gets.chomp.split(",").map { |ele| ele.to_i }
            valid = true if response.all? { |num| between?(1,3) }
        end
        #debugger
        response
    end

    def won?
        if self.T2 == [7,6,5,4,3,2,1] || self.T3 == [7,6,5,4,3,2,1]
            return true
        end
        false
    end

    def cheat
        self.T3 = [7,6,5,4,3,2,1]
    end

    attr_writer :T3


end
    
# game = Towers.new
# game.get_move