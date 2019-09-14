module Slideable

  def horizontal_dirs
    HORIZONTAL_DIRS.dup
  end

  def diagonal_dirs 
    DIAGONAL_DIRS.dup
  end

  def symbol
    :pawn
  end
  
  def moves
    move_options = []

    dirs = move_dirs.each do |dir|
      dx, dy = dir
      move_options += grow_unblocked_moves_in_dir(dx, dy)
    end
    move_options
  end

  private

  HORIZONTAL_DIRS = [[1, 0], [-1, 0], [0, 1], [0, -1]]
  DIAGONAL_DIRS = [[1, 1], [-1, -1], [1, -1], [-1, 1]]

  def grow_unblocked_moves_in_dir(dx, dy)
    unblocked_moves = []
    new_pos = [pos.first + dx, pos.last + dy]

    while board.valid_pos?(new_pos) && board[new_pos].empty?
      unblocked_moves << new_pos 
      new_pos = [pos.first + dx, pos.last + dy]
    end

    if board[new_pos].color != self.color && board.valid_pos?(new_pos)
      unblocked_moves << new_pos
    end

    unblocked_moves
  end

  
end