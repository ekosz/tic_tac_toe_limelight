on_button_pushed do
  clear_board
  
  hide_buttons

  play_again
end

private

def clear_board
  scene.find_by_name("cell").each { |cell| cell.text = "" }
end

def hide_buttons
  scene.find("buttons").style.transparency = "100%"
end

def play_again
  players = PlayButtonPlayersBuilder.new(scene.player_1, scene.player_2)

  scene.make_move(players.player_1, players.player_2)
end
