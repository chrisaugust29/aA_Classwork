require_relative "./modslideable"
require_relative "./piece"

class Queen < Piece

    include Slideable

    def symbol
       if self.color == :b
            "♚"
        else
            "♔"
        end
    end

    def move_dirs
        moves = []
        moves += DIAGONAL_DIRS
        moves += HORIZONTAL_DIRS
       return moves
    end

end

