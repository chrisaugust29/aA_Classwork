
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
          result +=  grow_unblocked_moves_in_dir(pos)
        end
        result
    end

    private 
    def move_dirs
        raise "this method should be overwritten"
    end

    def grow_unblocked_moves_in_dir(dx, dy) # broken cause we dont have null piece condition
        row_x , col_y = @pos  
        moveable = true 
        result = [] 

        while moveable 
            row_x = row_x + dx 
            col_y = col_y + dy 
            newpos = [row_x, col_y]
        
            moveable = false unless newpos.all? { |ele| (0..7).include?(ele) } 
                 if @board[newpos].color == self.color
                    moveable = false
                 else 
                    result << newpos
                    moveable = false 
                end
                result << newpos if moveable == true
          
        end
        result
     end
     
end
