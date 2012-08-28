on_mouse_clicked do
  @play_button = scene.find("play_button")
  @grid_util = GridUtil.new(scene)

  if game_started?
    production.player_1 = 
      TicTacToe::Player::Human.new(:letter => @grid_util.letter(current_player), 
                                   :move => cell_location)

    production.player_2 = no_move_human_or_computer

    game = production.game(@grid_util.current_grid)
    game.start
    @grid_util.set_cells_from_game(game)

    if game.solved? || game.cats?
      enable_play_button
      scene.find("headline").text = (game.solved? ? "#{game.winner} won!" : "Cats Game!")
    end

  end
end

def no_move_human_or_computer
  if scene.find("player_#{other_player}").drop_down.value == "Human"
    no_move_player
  else
    TicTacToe::Player::Computer.new(:letter => @grid_util.letter(other_player))
  end
end

def no_move_player
  TicTacToe::Player::Human.new(:letter => @grid_util.letter(other_player),
                               :move => nil)
end

def current_player
  o_count = count("o")
  x_count = count("x")

  return "1" if o_count == x_count

  "2"
end

def count(letter)
  scene.find_by_name("cell").select { |cell| cell.text == letter }.count
end

def other_player
  current_player == "1" ? "2" : "1"
end

def cell_location
  self.id[-1..-1] # Last char of string ex. "cell9" => "9"
end

def game_started?
  @play_button.style.transparency != "0%"
end

def enable_play_button
  @play_button.style.transparency = "0%"
end
