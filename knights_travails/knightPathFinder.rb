
require_relative "../skeleton/lib/00_tree_node.rb"
class KnightPathFinder

    def self.valid_moves(pos)
        row = pos[0]
        col = pos[-1]
        moves_arr = []
        i = 0
        j = 0
        range = ((0...8).to_a)
        while j < 8
            
            if range.include?(row+i) && range.include?(col+i) &&
                if !moves_arr.include?([row+i, col+j])
                    moves_arr << [row+i, col+j] 
                end
                if !moves_arr.include?([row+j, col+i])
                    moves_arr << [row+j, col+i]
                end
            elsif range.include?(row-i) && range.include?(col-i) &&
                if !moves_arr.include?([row-i, col-j])
                    moves_arr << [row-i, col-j] 
                end
                if !moves_arr.include?([row-j, col-i])
                    moves_arr << [row-j, col-i]
                end
            end
            i += 2 
            j += 1
        end
        moves_arr
    end

    def initialize(root_loc)
        @root_loc = PolyTreeNode.new(root_loc)
        @move_tree = self.build_move_tree
        @considered_pos = [@root_loc]
        
    end



end


# tree = PolyTreeNode.new("a")
# p tree

arrs = KnightPathFinder.valid_moves([4, 4])
p arrs 