require_relative "piecesfile"

class Board

    def initialize
        @rows = Array.new(8) { Array.new(8)}
        @null = Null.instance
        self.fill_board
    end

    def fill_board
        
        (0..7).each do |row|
            (0..7).each do |col|
                if row < 2 || row > 5
                    @rows[row][col] = fill_pieces(row,col)
                else
                    @rows[row][col] = @null
                end
            end
        end
    end

    def print
        @rows.each do |row|
            symbols = row.map {|ele| ele.symbol}
            puts symbols.join(" ")
               
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

    def move_piece(start_pos, end_pos, color)
        raise "invalid start" if self[start_pos].symbol == "-" 
        raise "invalid move" unless valid_move(start_pos) && valid_move(end_pos)
        raise "wrong color" if self[start_pos].color != color  
        self[end_pos] = self[start_pos]
        self[start_pos] = @null

    end

    def valid_move(pos)
        pos.all? { |ele| (0..7).include?(ele) }

    end 
    
    # def start 
    #      (0..7).each do |row|
    #         (0..7).each do |col|
    #             if row < 2 || row > 5
    #                 @rows[row][col] = fill_pieces(row,col)
    #             end
    #         end
    #     end

    



    protected 
    def fill_pieces(row, col)
        if row == 1 
           return Pawn.new(:w, self, [row, col])
        elsif row == 6 
           return Pawn.new(:b, self, [row,col] )
        end

        if row == 0 && (col == 0 || col == 7)
         return   Rook.new(:w, self, [row, col])
        elsif row == 7 && (col == 0 || col == 7)
          return  Rook.new(:b, self, [row, col])
        end

        if row == 0 && (col == 1 || col == 6)
         return   Knight.new(:w, self, [row, col])
        elsif row == 7 && (col == 1 || col == 6)
          return   Knight.new(:b, self, [row, col])
        end

         if row == 0 && (col == 2 || col == 5)
          return   Bishop.new(:w, self, [row, col])
        elsif row == 7 && (col == 2 || col == 5)
          return   Bishop.new(:b, self, [row, col])
        end

        if row == 0 && col == 3 
         return    Queen.new(:w, self, [row, col])
        elsif row == 7 && col == 3
          return   Queen.new(:b, self, [row, col])
        end

        if row == 0 && col == 4 
         return   King.new(:w, self, [row, col])
        elsif row == 7 && col == 4
          return   King.new(:b, self, [row, col])
        end

    end

    
end

 chess = Board.new
# p chess.move_piece([1,1], [8,1])
# p chess.start
chess.move_piece([1,1] ,[4,4] )
print chess([4,4])


