on_button_pushed do
  unless button_disabled? 
    @grid_util = GridUtil.new(scene)

    @grid_util.clear_grid
    scene.find("headline").text = ""
    set_production_players

    game = production.game(@grid_util.current_grid)
    game.start
    @grid_util.set_cells_from_game(game)
    
    disable_button unless game.cats?

    scene.find("headline").text = "Cats Game!" if game.cats?
  end
end

def set_production_players
  unless scene.find("player_1").drop_down.value == "Human"
    production.player_1 = computer_or_human_player("1")
    production.player_2 = computer_or_human_player("2")
  else
    production.player_1 = no_move_player( @grid_util.letter("1") )
    production.player_2 = no_move_player( @grid_util.letter("2") )
  end
end

def computer_or_human_player(num)
  if scene.find("player_#{num}").drop_down.value == "Computer"
    return TicTacToe::Player::Computer.new(:letter => @grid_util.letter(num))
  end

  no_move_player( @grid_util.letter(num) )
end

def no_move_player(letter)
  TicTacToe::Player::Human.new(:letter => letter, :move => nil)
end

def button_disabled?
  self.style.transparency != "0%"
end

def disable_button
  self.style.transparency = "50%" 
end
