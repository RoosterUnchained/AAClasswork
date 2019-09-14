class Piece
  attr_reader :color, :board, :pos

  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end

  def to_s
  case symbol
    when :pawn 
      if self.color == :white
        return "\u2659"
      else
        return "\u265f"
      end
    when :rook
      if self.color == :white 
        return "\u2656"
      else
        return "\u265c"
      end
    when :knight
      if self.color == :white 
        return "\u2658"
      else
        return "\u265e"
      end
    when :king
      if self.color == :white 
        return "\u2654"
      else
        return "\u265a"
      end
    when :bishop
      if self.color == :white 
        return "\u2657"
      else
        return "\u265d"
      end
    when :queen
      if self.color == :white 
        return "\u2655"
      else
        return "\u265b"
      end
    when :null_piece
      return " "
    end
    
  end

  def empty?
    symbol == :null_piece
  end
end

