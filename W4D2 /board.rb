require_relative "./Pieces/piece.rb"

class Board

    def initialize
        @rows = Array.new(8) { Array.new(8)}
        self.fill_board
    end

    def fill_board
        (0..7).each do |row|
            (0..7).each do |col|
                if row < 2 || row > 5
                    @rows[row][col] =  fill_pieces(row,col)
                else
                    @rows[row][col] = Null.new
                end
            end
        end
    end

    

    def [](pos)
        row, col = pos
        @rows[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @rows[row][col] = val 
    end

    def move_piece(start_pos, end_pos)
        raise "invalid start" if self[start_pos] == nil
        raise "invalid move" unless valid_move(start_pos) && valid_move(end_pos)
        self[end_pos] = self[start_pos]
        self[start_pos] = nil

    end

    def valid_move(pos)
        pos.all? { |ele| (0..7).include?(ele) }

    end 
    private 
    def fill_pieces(row, col)
        if row == 1 
            Pawn.new(:w, self, [row, col])
        elsif row == 6 
            Pawn.new(:b, self, [row,pos] )
        end

        if row == 0 && (col == 0 || col == 7)
            Rook.new(:w, self, [row, col])
        elsif row == 7 && (col == 0 || col == 7)
            Rook.new(:b, self, [row, col])
        end

        if row == 0 && (col == 1 || col == 6)
            Knight.new(:w, self, [row, col])
        elsif row == 7 && (col == 1 || col == 6)
            Knight.new(:b, self, [row, col])
        end

         if row == 0 && (col == 2 || col == 5)
            Bishop.new(:w, self, [row, col])
        elsif row == 7 && (col == 2 || col == 5)
            Bishop.new(:b, self, [row, col])
        end

        if row == 0 && col == 3 
            Queen.new(:w, self, [row, col])
        elsif row == 7 && col == 3
            Queen.new(:b, self, [row, col])
        end

        if row == 0 && col == 4 
           King.new(:w, self, [row, col])
        elsif row == 7 && col == 4
            King.new(:b, self, [row, col])
        end

    end

    
end

p chess = Board.new
# p chess.move_piece([1,1], [8,1])
p chess
