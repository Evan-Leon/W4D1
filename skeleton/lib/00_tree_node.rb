require "byebug"
class PolyTreeNode
    attr_reader :parent, :children, :value
    attr_writer :children
    
    def initialize(value = nil)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(parent_node)
        
        if !parent.nil?
            parent.children.delete(self)
        end
        if !parent_node.nil?
            @parent = parent_node
            if !parent_node.children.include?(self) 
                parent_node.children << self 
            end
        else  
            @parent = nil
        end
    end

    def add_child(child_node)
         child_node.parent = self
    end

    def remove_child(child_node)
        if children.include?(child_node)
            child_node.parent = nil
        else  
            raise "node is not a child!"
        end
    end

    def inspect
        {'value' => @value, 'parent_value' => @parent.value}.inspect
    end

   def dfs(target_value)
    
        if target_value == self.value
            return self
        end
            
        self.children.each do |child|
            child_rec = child.dfs(target_value)
            return child_rec if !child_rec.nil? 
        end
         nil
    end

    def bfs(target_value)
      q = [self]

      unless q.empty?
        ele = q.shift
        if ele.value == target_value
            return ele  
        else  
            q += ele.children 
        end

      end
      nil
    end
end

