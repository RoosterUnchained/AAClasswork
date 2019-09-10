require_relative 'tic_tac_toe_node'

class SuperComputerPlayer < ComputerPlayer
  def move(game, mark)
    # if winning_move.selectable? chooses winning_move
    noder = TicTacToeNode.new(game.board, mark)
    noder.children.each do |child|
      if child.winning_node?(mark)
        move = child.prev_move_position 
      end
    end
    move || random_move()
    # can pick winning move out from two moves deep
    # if opponent_move.winning_move? then blocks
    # raise error if selectable !moves.include?(winning_move) || !moves.include?(drawing_move)
  end
end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end
