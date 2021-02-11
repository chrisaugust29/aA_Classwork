
module Slideable

    HORIZONTAL_DIRS = [
        [0,-1],
        [0,1],
        [1,0],
        [-1,0]
    ]
    

    DIAGONAL_DIRS = [
        [-1,1],
        [1,1],
        [-1,-1],
        [1,-1]
    ]


    def horizontal_dirs
        HORIZONTAL_DIRS
    end

    def diagonal_dirs 
        DIAGONAL_DIRS
    end

    def moves
        result =[]

        self.move_dirs.each do |pos|
            dx, dy = pos
          result +=  grow_unblocked_moves_in_dir(dx,dy)
        end
        result
    end

    private 
    def move_dirs
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
