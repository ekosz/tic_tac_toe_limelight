clear do
  message :id => "headline", :text => ""
end

clear do
  grid :id => "grid" do
    9.times do |i|
      cell :id => "cell#{i+1}"
    end
  end
end

clear do
  play_button :players => "button", :id => "play_button", :text => "play"
end

clear do
  player_chooser :players => "drop_down", :id => "player_1", 
    :choices => [TicTacToe::Player::HUMAN, TicTacToe::Player::COMPUTER].map(&:capitalize)

  player_chooser :players => "drop_down", :id => "player_2",
    :choices => [TicTacToe::Player::HUMAN, TicTacToe::Player::COMPUTER].map(&:capitalize)
end
