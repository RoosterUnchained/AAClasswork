module Searchable 
  def dfs(target_value)
    return self if target_value == self.value 
    self.children.each do |child|
      result = child.dfs(target_value)
      return result if !result.nil?
    end
    nil
  end

  def bfs(target_value)
    queue = [self]
    until queue.empty?
      current_node = queue.shift
      return current_node if current_node.value == target_value 
      queue += current_node.children 
    end
    return nil 
  end



end

class PolyTreeNode

  include Searchable

  attr_reader :value, :parent, :children
  def initialize(value)
    @value, @parent, @children = value, nil, []
  end
  
  def parent=(parent_node)
    @parent.children.delete(self) if parent
    @parent = parent_node
    
    if parent && !parent.children.include?(self)
      parent.children << self
    end
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)  
    raise "is not a child" if !self.children.include?(child_node)
    child_node.parent = nil
  end

end