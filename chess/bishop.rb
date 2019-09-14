class Bishop < Piece
  include Slideable

  def symbol
    :bishop
  end
  
  def move_dirs
    diagonals = diagonal_dirs
  end
end