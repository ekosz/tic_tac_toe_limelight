on_mouse_clicked do
  @play_button = scene.find("play_button")
  @grid_util = GridUtil.new(scene)

  if game_started?


    players = CellPlayersBuilder.new(current_player, 
                                 cell_location, 
                                 scene.find("player_#{other_player}").drop_down.value)

    game = TicTacToe::Game.new(@grid_util.current_grid,
                               players.player_1,
                               players.player_2)

    results = MakeMoveInteractor.new(game).execute

    @grid_util.set_cells_from_game(results[:grid])

    if results[:game_solved]
      enable_play_button
      set_headline_text(results[:headline])
    end

  end
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

def set_headline_text(text)
  scene.find("headline").text = text
end
