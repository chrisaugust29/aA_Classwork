require_relative "piece.rb"

class Board

    def initialize
        @rows = Array.new(8) { Array.new(8)}
        self.fill_board
    end

    def fill_board
        (0..7).each do |row|
            (0..7).each do |col|
                if row < 2 || row > 5
                    @rows[row][col] = Piece.new
                else
                    @rows[row][col] = nil
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
        raise "invalid start" if @rows[start_pos] == nil

        @rows[end_pos] = @rows[start_pos]
        @rows[start_pos] = nil
    end

end

p chess = Board.new
p chess.move_piece([1,1], [2,1])

