require_relative './00_tree_node.rb'
class KnightPathFinder
    attr_accessor :root_node
    
    def initialize(position)
        @position = position
        @root_node = nil
    end
    def build_move_tree 
        self.root_node = PolyTreeNode.new(@position) if @root_node == nil
    end
end 