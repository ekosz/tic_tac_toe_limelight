class ClickCellInteractor

  def initialize(production, current_grid, current_player, cell_location, other_player_value)
    @production = production
    @current_grid = current_grid
    @current_player = current_player
    @other_player_value = other_player_value
    @cell_location = cell_location
  end

  def execute
    @production.player_1 = current_human_player
    @production.player_2 = no_move_human_or_computer_player
    game = @production.game(@current_grid)
    game.start

    results = {}

    results[:game_solved] = game.cats? || game.solved?
    results[:headline] = if game.solved?
                           "#{game.winner} won!"
                         elsif game.cats?
                           "Cats game!"
                         end
    results[:grid] = game.grid

    results
  end

  private 

  def current_human_player
    TicTacToe::Player::Human.new(:letter => letter(@current_player), 
                                 :move => @cell_location)
  end

  def no_move_human_or_computer_player
    if @other_player_value == "Human"
      no_move_player
    else
      TicTacToe::Player::Computer.new(:letter => letter(other_player))
    end
  end

  def no_move_player
    TicTacToe::Player::Human.new(:letter => letter(other_player),
                                 :move => nil)
  end

  def other_player
    @current_player == "1" ? "2" : "1"
  end

  def letter(num)
    num == "1" ? TicTacToe::O : TicTacToe::X
  end

end
