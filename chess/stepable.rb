module Stepable
  def moves
    move_options = []
    diffs = move_diffs
    diffs.each do |diff|
      new_pos = [pos[0] + diff[0], pos[1] + diff[1]]
      if board.valid_pos?(new_pos) && (board.empty?(new_pos) || board[new_pos].color != self.color)
        move_options << new_pos
      end
    end
    move_options
  end
end