require_relative "./modslideable"
require_relative "./piece"

class Rook < Piece

    include Slideable

    def symbol
       if self.color == :b
            "♜"
        else
            "♖"
        end
    end

    def move_dirs
       return HORIZONTAL_DIRS
    end

end

