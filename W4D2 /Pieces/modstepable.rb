
module Stepable

    def moves
        result =[]

        self.move_diffs.each do |pos|
            dx, dy = pos
            result += grow_unblocked_moves_in_dir(pos)
        end
        result
    end


    private
    def move_diffs
        raise "this method should be overwritten"
    end

    def grow_unblocked_moves_in_dir(dx, dy)
        row_x , col_y = @pos  
        moveable = true 
        result = [] 

        while moveable 
            row_x = row_x + dx 
            col_y = col_y + dy 
            newpos = [row_x, col_y]
        
            moveable = false unless newpos.all? { |ele| (0..7).include?(ele) } 
            self.color == :b ? opposite_color = :w : opposite_color = :b
                if @board[newpos].color == self.color
                    moveable = false
                elsif @board[newpos].color == opposite_color
                    result << newpos
                    moveable = false 
                end
                result << newpos if moveable == true
          
        end
        result
     end

end