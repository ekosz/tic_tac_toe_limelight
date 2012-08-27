message :id => "headline", :text => ""

grid :id => "grid" do
  9.times do |i|
    cell :id => "cell#{i}"
  end
end

play_button :players => "button", :id => "play_button"

player_1_chooser :players => "combo_box", :id => "player_1", 
  :choices => [TicTacToe::Player::COMPUTER], :value => TicTacToe::Player::HUMAN
player_2_chooser :players => "combo_box", :id => "player_2",
  :choices => [TicTacToe::Player::COMPUTER], :value => TicTacToe::Player::HUMAN
