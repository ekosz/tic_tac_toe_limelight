class GridUtil
  def initialize(scene)
    @scene = scene
  end

  def clear_grid
    cells.each { |cell| cell.text = "" }
  end


end
