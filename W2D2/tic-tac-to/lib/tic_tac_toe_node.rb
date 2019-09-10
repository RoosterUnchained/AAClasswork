require_relative 'tic_tac_toe'


class TicTacToeNode

  attr_reader :board, :next_mover_mark, :prev_move_pos

  

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    #needs to call losing

    if @board.over? 
     return @board.won? && board.winner != evaluator
    end
    
    if @next_mover_mark != evaluator
      self.children.any? { |child| child.losing_node?(evaluator) } 
    else 
      self.children.all? { |child| child.losing_node?(evaluator) }
    end
    
    #needs to call losing position condition
    #needs to test iterations of moves
    # may need to call game states
    # needs to test position itself, this is possibly different from what we would see in the game states variable 
    # base_case = board.over? 
    # may need multiple calls for board positions
  end

  def winning_node?(evaluator)


    if @board.over? 
      return @board.won? && board.winner == evaluator
    end
     
     if @next_mover_mark == evaluator
       self.children.any? { |child| child.winning_node?(evaluator) } 
     else 
       self.children.all? { |child| child.winning_node?(evaluator) }
     end

    #needs to call winning position condition
    #needs to test iterations of moves
    # may need to call game states
    # needs to test position itself, this is possibly different from what we would see in the game states variable 
    # base_case = board.over? 
    # may need multiple calls for board positions
  end


  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    game_states = []
    
    (0..2).each do |hor_pos|   
      (0..2).each do |vert_pos|
        dupper_board = @board.dup
        board_pos = [hor_pos, vert_pos]
        if dupper_board.empty?(board_pos)
            dupper_board[board_pos] = @next_mover_mark
            next_mark = @next_mover_mark == :o ? :x : :o

            # next_mark = :x if @next_mover_mark == :o 
            # next_mark = :o if @next_mover_mark == :x

            game_states << TicTacToeNode.new(dupper_board, next_mark, board_pos) 
      
        end
      end
    end
    game_states
  end
end