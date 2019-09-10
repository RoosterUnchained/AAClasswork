require_relative "00_tree_node.rb"

class KnightPathFinder
  def initialize(position)
    @root_node = PolyTreeNode.new(position)
    @considered_positions = [position] 
    build_move_tree
    
    
  end

  def new_move_positions(position)
    valids = KnightPathFinder.valid_moves(position)
    positions = []
    valids.each do |valid|
      if !@considered_positions.include?(valid)
        positions << valid
        @considered_positions << valid 
      end
    end
    positions
  end

  MOVES = [[2, 1], [2, -1], [-2, 1], [-2, 1], [1, 2], [1, -2], [-1, 2], [-1, -2]] 
  def self.valid_moves(position)
    valid_moves = []
    hor_pos, vert_pos = position
    MOVES.each do |move|
      hor_move, vert_move = move 
      pros_pos = [hor_pos + hor_move, vert_pos + vert_move]
      valid_moves << pros_pos if pros_pos.all? { |comp_pos| comp_pos > 0 && comp_pos < 8 }
    end
     valid_moves 
  end 
  
  def build_move_tree
  
    queue = [@root_node]
    until queue.empty?
      current_node = queue.shift 
      
      current_pos = current_node.value
      new_move_positions(current_pos).each do |next_pos|
        next_node = PolyTreeNode.new(next_pos)
        current_node.add_child(next_node)
        queue << next_node 
      end
    end
  end
  
  def find_path(end_pos)
    node = @root_node.bfs(end_pos)
    trace_path_back(node)
  end

  def trace_path_back(node)
    path = []
    current_node = node
    until current_node.nil?
      path.unshift(current_node.value) 
      current_node = current_node.parent 
    end
    path
    #we need value of each parent node and final leaf node up to root_node in an sequentially organized array of positions
    #problems, probably can't add node itself to array? (or not?) 
  end
end 


kpf = KnightPathFinder.new([0, 0])
p kpf.find_path([7, 6]) # => [[0, 0], [1, 2], [2, 4], [3, 6], [5, 5], [7, 6]]
p kpf.find_path([6, 2]) # => [[0, 0], [1, 2], [2, 0], [4, 1], [6, 2]]