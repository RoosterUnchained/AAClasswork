require_relative "pieces"


class Board

  attr_accessor :grid 

  def initialize
    @grid = Array.new(8) { Array.new(8) }
    (0..7).each do |row|
      (0..7).each do |col|
        pos = [row, col]
        case row 
        when 1
          piece = Pawn.new(:black, self, pos)
        when 6 
          piece = Pawn.new(:white, self, pos)
        when 0
          case col 
          when 0, 7
            piece = Rook.new(:black, self, pos)
          when 1, 6 
            piece = Knight.new(:black, self, pos)
          when 2, 5 
            piece = Bishop.new(:black, self, pos)
          when 3
            piece = Queen.new(:black, self, pos)
          when 4 
            piece = King.new(:black, self, pos)
          end
        
        when 7 
          case col 
          when 0, 7
            piece = Rook.new(:white, self, pos)
          when 1, 6 
            piece = Knight.new(:white, self, pos)
          when 2, 5 
            piece = Bishop.new(:white, self, pos)
          when 3
            piece = Queen.new(:white, self, pos)
          when 4 
            piece = King.new(:white, self, pos)
          end
        
        when 2, 3, 4, 5
          piece = NullPiece.instance

        end
        add_piece(piece, pos)
      end
    end
  end


  def [](pos) 
    row, col = pos
    grid[row][col]
  end

  def []=(pos, val)
    row, col = pos 
    grid[row][col] = val
  end

  def add_piece(piece, pos)
    self[pos] = piece
  end

  def checkmate?(color)

  end

  def find_king(color)

  end

  def in_check?(color)

  end

  def move_piece(start_pos, end_pos)
    piece = self[start_pos]
    raise "no piece at starting position" if piece.is_a?(NullPiece) 
    raise "piece cannot occupy that position" unless piece.moves.include?(end_pos)
    piece = self[start_pos]
    self[end_pos] = piece
    self[start_pos] = nil
  end

  def valid_pos?(pos)
    pos.all? { |comp| comp >= 0 && comp < 8 }
  end
end



