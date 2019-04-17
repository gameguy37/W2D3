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

end

print [[1, 2, 3], [4, 5, 6], [7, 8, 9]].my_transpose