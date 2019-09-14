class Knight < Piece
  include Stepable

  def symbol
    :knight
  end
  
  def move_diffs
    [[-2, -1], [-2, 1], [2, -1], [2, 1], [1, 2], [1, -2], [-1, 2], [-1, -2]]
  end
end