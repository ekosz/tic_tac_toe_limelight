on_button_pushed do
  unless button_disabled? 
    @grid_util = GridUtil.new(scene)

    clear_game

    players = PlayButtonPlayersBuilder.new(scene.find("player_1").drop_down.value,
                                           scene.find("player_2").drop_down.value)

    game = TicTacToe::Game.new(@grid_util.current_grid,
                               players.player_1,
                               players.player_2)

    results = MakeMoveInteractor.new(game).execute

    @grid_util.set_cells_from_game(results[:grid])

    disable_button unless results[:game_solved]

    set_headline(results[:headline]) if results[:game_solved]
  end
end

def clear_game
  @grid_util.clear_grid
  clear_headline
end

def clear_headline
  scene.find("headline").text = ""
end

def button_disabled?
  self.style.transparency != "0%"
end

def disable_button
  self.style.transparency = "50%" 
end

def set_headline(text)
  scene.find("headline").text = text
end
