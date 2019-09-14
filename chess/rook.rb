class Rook < Piece
  include Slideable

  def symbol
    :rook
  end

  def move_dirs
    horizontal = horizontal_dirs
  end
end