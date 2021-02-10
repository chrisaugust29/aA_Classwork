require_relative "./piece"
require "singleton"

class Null < Piece

    include Singleton

    def initialize
        
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
         return "-"
    end

end