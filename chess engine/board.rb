require_relative "piece"

class Board

  attr_accessor :grid 

  def initialize
    @grid = Array.new(8) { Array.new(8) }
    (0..7).each do |row|
      (0..7).each do |col|
        case row 
        when 0, 1, 6, 7
          @grid[row][col] = "P"
        else
          @grid[row][col] = nil
        end
      end
    end

  end

  def render 
    grid.each { |row| p row }
  end

  def [](pos) 
    row, col = pos
    grid[row][col]
  end

  def []=(pos, val)
    row, col = pos 
    grid[row][col] = val
  end

  def move_piece(start_pos, end_pos)
    raise "no piece at starting position" if self[start_pos].nil? 
    raise "piece cannot occupy that position" if !self[end_pos].nil?
    piece = self[start_pos]
    self[end_pos] = piece
    self[start_pos] = nil
  end

  def valid_pos?(pos)
    pos.all? { |comp| comp >= 0 && comp < 8 }
  end
end


