class PlayerFactory

  def self.no_move_or_computer_player(player, value)
    return no_move_player(player) if value == "Human"

    computer_player(player)
  end

  def self.computer_player(player)
    TicTacToe::Player::Computer.new(:letter => letter(player))
  end

  def self.no_move_player(player)
    TicTacToe::Player::Human.new(:letter => letter(player), :move => nil)
  end

  private

  def self.letter(num)
    num == "1" ? TicTacToe::O : TicTacToe::X
  end
end
