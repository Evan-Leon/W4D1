require_relative "../skeleton/lib/00_tree_node.rb"
class KnightPathFinder

    def initialize(root_loc)
        @root_loc = PolyTreeNode.new(root_loc)
        @move_tree = self.build_move_tree
        @considered_pos = [@root_loc]
        
    end



end


# tree = PolyTreeNode.new("a")
# p tree