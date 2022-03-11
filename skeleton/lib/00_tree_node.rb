class PolyTreeNode
    attr_reader :value
    attr_accessor :parent, :children
    def initialize(value, parent = nil)
        @children = []
        @value = value
        @parent = parent
    end

    def parent=(node_value)
        
        if node_value == nil
            self.parent.children.delete(self)
            @parent = nil
        elsif self.parent != nil
            self.parent.children.delete(self)
            node_value.children << self
            @parent = node_value
        elsif !node_value.children.include?(self) && self.parent == nil 
            node_value.children << self
            @parent = node_value
        end
    end

    def show
        @children.dup
    end
    
    def add_child(child_node)

        child_node.parent = self
    end
    
    def remove_child(child_node)

        child_node.parent = nil 
    end

    def dfs(target_value)
        
        if self.value == target_value
            return self
        else
            self.children.each do |child_node|
                if child_node.children.length > 0
                    child_node.dfs(target_value)  
                end
            end
        end
        nil
    end
end