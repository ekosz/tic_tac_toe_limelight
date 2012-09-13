attr_accessor :player_1, :player_2

def make_move(player_1, player_2)
  game = TicTacToe::Game.new(current_grid, player_1, player_2)

  results = MakeMoveInteractor.new(game).execute

  set_cells_from_game(results[:grid])

  if results[:game_solved]
    scene.find("headline").text = results[:headline]
  end
end

private

def current_grid
  cells.map do |cell| 
    cell.text.to_s == "" ? nil : cell.text 
  end.each_slice(3).to_a
end

def set_cells_from_game(grid)
  grid.each_with_index do |row, i|
    row.each_with_index do |letter, j|
      find("cell#{cords(i, j)}").text = letter if letter
    end
  end
end

def cords(row, col)
  (row*3)+(col+1)
end

def cells
  find_by_name("cell")
end
