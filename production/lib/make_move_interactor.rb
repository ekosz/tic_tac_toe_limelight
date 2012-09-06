class MakeMoveInteractor

  def initialize(game)
    @game = game
  end

  def execute
    @game.start

    results = {}

    results[:game_solved] = solved?
    results[:headline] = headline_text
    results[:grid] = @game.grid

    results
  end

  private

  def solved?
    @game.cats? || @game.solved?
  end

  def headline_text
    if @game.solved?
      "#{@game.winner} won!"
    elsif @game.cats?
      "Cats Game!"
    end
  end

end
