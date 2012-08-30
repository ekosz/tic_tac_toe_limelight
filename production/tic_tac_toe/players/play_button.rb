on_button_pushed do
  unless button_disabled? 
    @grid_util = GridUtil.new(scene)

    clear_game

    set_production_players

    game = update_game_board

    disable_button unless game_over?(game)

    set_headline if game_over?(game)
  end
end

def clear_game
  @grid_util.clear_grid
  clear_headline
end

def clear_headline
  scene.find("headline").text = ""
end

def set_production_players
  if scene.find("player_1").drop_down.value == "Human"
    production.player_1 = no_move_player("1")
    production.player_2 = no_move_player("2")
  else
    production.player_1 = computer_or_human_player("1")
    production.player_2 = computer_or_human_player("2")
  end
end

def computer_or_human_player(num)
  if scene.find("player_#{num}").drop_down.value == "Computer"
    return TicTacToe::Player::Computer.new(:letter => @grid_util.letter(num))
  end

  no_move_player(num)
end

def no_move_player(player)
  TicTacToe::Player::Human.new(:letter => @grid_util.letter(player), 
                               :move => nil)
end

def update_game_board
  game = production.game(@grid_util.current_grid)
  game.start
  @grid_util.set_cells_from_game(game.grid)
  game
end

def button_disabled?
  self.style.transparency != "0%"
end

def disable_button
  self.style.transparency = "50%" 
end

def game_over?(game)
  game.cats?
end

def set_headline
  scene.find("headline").text = "Cats Game!"
end
