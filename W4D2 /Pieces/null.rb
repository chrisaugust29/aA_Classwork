require_relative "./piece"

class Null < Piece

    include Singleton

    def initialize
        @color.symbol
    end

    def moves
        options = []
        (0..7).each do |row|
            (0..7).each do |col|
                options << [row,col]
            end
        end
        options
    end

    def symbol
        @color = ""
    end

end