class CellPlayersBuilder
  
  def initialize(current_player, cell_location, other_player_value, factory = PlayerFactory)
    @current_player = current_player
    @cell_location = cell_location
    @other_player_value = other_player_value
    @factory = factory
  end

  def player_1
    current_human_player
  end

  def player_2
    @factory.no_move_or_computer_player(other_player, @other_player_value)
  end

  private

  def current_human_player
    TicTacToe::Player::Human.new(:letter => letter(@current_player), 
                                 :move => @cell_location)
  end

  def other_player
    @current_player == "1" ? "2" : "1"
  end

  def letter(num)
    num == "1" ? TicTacToe::O : TicTacToe::X
  end

end
