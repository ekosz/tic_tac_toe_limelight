class PlayButtonPlayersBuilder

  def initialize(player_1_value, player_2_value, factory = PlayerFactory)
    @player_1_value, @player_2_value = player_1_value, player_2_value
    @factory = factory
  end

  def player_1
    return @factory.no_move_player("1") if @player_1_value == "Human"
    @factory.no_move_or_computer_player("1", @player_1_value)
  end

  def player_2
    return @factory.no_move_player("2") if @player_1_value == "Human"
    @factory.no_move_or_computer_player("2", @player_2_value)
  end

end
