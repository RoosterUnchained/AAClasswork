require_relative "00_tree_node.rb"

class KnightPathFinder
  def initialize(position)
    @root_node = PolyTreeNode.new(position)
    build_move_tree
    @considered_positions
    
    
  end

  def new_move_positions(position)
    if !@considered_positions.include?(position)
       valid_moves(position)
  end

  MOVES = [[2, 1], [2, -1], [-2, 1], [-2, 1], [1, 2], [1, -2], [-1, 2], [-1, -2]] 
  def self.valid_moves(position)
    hor_pos, vert_pos = position
    MOVES.each do |move|
       hor_move, vert_move = move 
       pros_pos = [hor_pos + hor_move, vert_pos + vert_move]
      if board.include?(pros_pos)
  end
end