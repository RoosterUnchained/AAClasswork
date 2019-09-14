class Pawn < Piece 
  def moves
    forward_steps + side_attacks
  end

  def symbol
    :pawn
  end

  def at_start_row?
    
    pos[0] == 1 || pos[0] == 6

  end

  def forward_dir
    if self.color == :white
      return -1
    else
      return 1
    end
  end

  def forward_steps
    possible_forwards = []
    row, col = pos 
    two_steps = forward_dir * 2
    two = [two_steps + row, col]
    one_step = [row + forward_dir, col]

    if at_start_row? && board.valid_pos?(two)
      possible_forwards << two 
    end
    
    if board.valid_pos?(one_step)
      possible_forwards << one_step
    end 

    possible_forwards
  end

  def side_attacks
    possible_attacks = []
    row, col = pos 
    [[row + forward_dir, col - 1], [row + forward_dir, col + 1]].each do |attack|
      if board.valid_pos?(attack) && !board[attack].empty? && board[attack].color != self.color
        possible_attacks << attack 
      end
    end
    possible_attacks
  end


end

