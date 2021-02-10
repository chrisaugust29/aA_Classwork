require_relative "./modslideable"
require_relative "./piece"

class Bishop < Piece

    include Slideable

    def symbol
       if self.color == "b"
            "♝"
        else
            "♗"
        end
    end

    def move_dirs
       return DIAGONAL_DIRS
    end

end

