
require_relative "./piece"

class Pawn < Piece

    def symbol
        if self.color == :b
            "♟"
        else
            "♙"
        end
    end

    def moves
        result =[]

        result += self.side_attacks
        result += forward_steps
        result
       
    end

    private

    def at_start_row?
        if self.color == :b
            return true if self.pos[0] == 6
        else
            return false
        end

        if self.color == :w
            return true if self.pos[0] == 1
        else
            return false
        end
    end

    def forward_dir
        return -1 if self.color == :b
        return 1 if self.color == :w
    end

    def forward_steps
        row, col = @pos
        new_row = row + forward_dir
        newpos = [new_row, col]
        return newpos if valid_move?(newpos)
    end

    def valid_move?(newpos)
        moveable = true 
        
        moveable = false unless newpos.all? { |ele| (0..7).include?(ele) } 
            if @board[newpos].color == self.color
                moveable = false
            end
        moveable
    end

    def side_attacks
        options = []

        row, col = @pos
        new_row = row + self.forward_dir
        new_col = col + 1
        newpos = [new_row, new_col]
        self.color == :b ? opposite_color = :w : opposite_color = :b
        tester = @board[newpos].color
        if tester == opposite_color
            options << newpos
        end

        new_col = col - 1
        newpos = [new_row, new_col]
        tester = @board[newpos].color
        options << newpos if tester == opposite_color
        
        options
    end

end

