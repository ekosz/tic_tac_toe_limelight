on_mouse_clicked do
  @play_button = scene.find("play_button")
  @grid_util = GridUtil.new(scene)

  if game_started?
    production.player_1 = current_human_player

    production.player_2 = no_move_human_or_computer_player

    game = production.game(@grid_util.current_grid)
    game.start

    @grid_util.set_cells_from_game(game)

    if game_solved?(game)
      enable_play_button
      set_headline_text(game)
    end

  end
end

def current_human_player
  TicTacToe::Player::Human.new(:letter => @grid_util.letter(current_player), 
                               :move => cell_location)
end

def no_move_human_or_computer_player
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

def game_solved?(game)
  game.solved? || game.cats?
end

def game_started?
  @play_button.style.transparency != "0%"
end

def enable_play_button
  @play_button.style.transparency = "0%"
end

def set_headline_text(game)
  if game.solved?
    set_winning_text(game.winner)
  else
    set_cats_text
  end
end

def set_winning_text(winner)
  scene.find("headline").text = "#{winner} won!"
end

def set_cats_text
  scene.find("headline").text = "Cats Game!"
end
