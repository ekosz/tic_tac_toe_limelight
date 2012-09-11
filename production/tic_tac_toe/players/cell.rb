on_mouse_clicked do
  players = CellPlayersBuilder.new(current_player, cell_location, other_player_value)

  scene.make_move(players.player_1, players.player_2)
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

def other_player_value
  scene.send(:"player_#{other_player}")
end

def other_player
  current_player == "1" ? "2" : "1"
end

def cell_location
  self.id[-1..-1] # Last char of string ex. "cell9" => "9"
end
