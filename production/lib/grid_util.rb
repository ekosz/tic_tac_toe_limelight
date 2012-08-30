class GridUtil
  def initialize(scene)
    @scene = scene
  end

  def clear_grid
    cells.each { |cell| cell.text = "" }
  end

  def letter(num)
    num == "1" ? TicTacToe::O : TicTacToe::X
  end

  def current_grid
    cells.map do |cell| 
      cell.text.to_s == "" ? nil : cell.text 
    end.each_slice(3).to_a
  end

  def set_cells_from_game(grid)
    grid.each_with_index do |row, i|
      row.each_with_index do |letter, j|
        @scene.find("cell#{cords(i, j)}").text = letter if letter
      end
    end
  end

  private

  def cords(row, col)
    (row*3)+(col+1)
  end

  def cells
    @scene.find_by_name("cell")
  end

end
