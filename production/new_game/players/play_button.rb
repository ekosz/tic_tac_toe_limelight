on_button_pushed do
  players = PlayButtonPlayersBuilder.new(player_1, player_2)

  play_scene = production.open_scene("tic_tac_toe")

  play_scene.player_1 = player_1
  play_scene.player_2 = player_2

  play_scene.make_move(players.player_1, players.player_2)
end

private

def player_1
  @player_1 ||= player("1")
end

def player_2
  @player_2 ||= player("2")
end

def player(num)
  scene.find("player_#{num}").drop_down.value
end
