
 
class Piece
    attr_reader :color, :board, :pos
    def initialize(color, board, pos)
        @color = color 
        @board = board
        @pos = pos 


    end

    def to_s
        self.symbol 
    end

    def empty?(pos)
        row, col = pos
        return true if @board[row][col].symbol == "-"

        false
    end

    # def valid_moves(pos)
    #     return true if self.empty?(pos)
    #     return false if @board[pos].color == self.color 
    # end

    def pos=(val)
        @pos = val

    end 

    def symbol

    end 

    private 
    def move_into_check?(end_pos)

    end 


    
end

#move dir = colection of direction ex: [0,-1] backwards just one step away  
# 