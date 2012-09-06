on_button_pushed do

  players = PlayButtonPlayersBuilder.new(scene.find("player_1").drop_down.value,
                                         scene.find("player_2").drop_down.value)
  play_scene = production.open_scene("tic_tac_toe")

  @grid_util = GridUtil.new(play_scene)

  game = TicTacToe::Game.new(@grid_util.current_grid,
                             players.player_1,
                             players.player_2)

  results = MakeMoveInteractor.new(game).execute

  @grid_util.set_cells_from_game(results[:grid])

  set_headline(play_scene, results[:headline]) if results[:game_solved]
end

def set_headline(scene, text)
  scene.find("headline").text = text
end
