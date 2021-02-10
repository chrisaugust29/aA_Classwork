require_relative "./modstepable"
require_relative "./piece"

class King < Piece

    include Stepable

    def symbol
       if self.color == :b
            "♛"
        else 
            "♕"
        end
    end

    def move_diffs
        moves = []
        moves += DIAGONAL_DIRS
        moves += HORIZONTAL_DIRS
       return moves
    end

end

