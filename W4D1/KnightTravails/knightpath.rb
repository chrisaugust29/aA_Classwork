require_relative './00_tree_node.rb'
class KnightPathFinder
    attr_accessor :root_node

    #moves: [0,0]start  [1,2][
        MOVES = [
                [2,1],
                [2,-1],
                [1,2],
                [1,-2],
                [-1,2],
                [-1,-2],
                [-2,1],
                [-2,-1]
                ]


    ##anything within the 8x8 board 
    #anything outside of range of (0,0) & (7,7) is invalid 
    #returns array of valid moves 

    def self.valid_moves(position)  #any start position 
        valid_pos = []
        x, y = position   #as long 0 >x < 7 

        MOVES.each do |sub|
            sub_x, sub_y = sub
            added_pos = [sub_x + x, sub_y + y]
            if (added_pos[0] > 0 && added_pos[0] < 7) && (added_pos[1]>0 && added_pos[1]<7 ) 
                valid_pos << added_pos
            end
        end
        valid_pos
    end
    
    def initialize(start_position) 
        @position = start_position
        @considered_pos = [start_position]
        @root_node = PolyTreeNode.new(@position) 
        build_move_tree
    end
    def build_move_tree #all possible moves  
        self.root_node
    end
end 