class Queen < Piece
  include Slideable

  def symbol
    :queen
  end

  def move_dirs
    all_dirs = horizontal_dirs + diagonal_dirs
  end
end