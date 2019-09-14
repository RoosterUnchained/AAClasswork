require_relative "cursor"
require_relative "board"
require "colorize"

class Display
  attr_accessor :board, :cursor 

  def initialize(board)
    @board = board 
    @cursor = Cursor.new([0,0], board)
  end

  def render
    system('clear')
    board.grid.each_with_index do |row, i|
      square = row.map.with_index do |piece, j|
        if cursor.cursor_pos == [i, j]
          background = (cursor.selected ? :green : :red)
        else
          background = ((i+j).even? ? :yellow : :blue)
        end
        (" " + piece.to_s + " ").colorize(:color => :black, :background => background)
      end
      puts square.join
    end
  end
end

b = Board.new
d = Display.new(b)
loop do
  d.render
  d.cursor.get_input
end