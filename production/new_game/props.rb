background do

  clear do
    headline :text => "Welcome to Tic Tac Toe"
  end

  clear do
    three_forth do
      half do
        clear { label :text => "Player 1" }
        clear do
          player_chooser :players => "drop_down", :id => "player_1", 
            :choices => [TicTacToe::Player::HUMAN, TicTacToe::Player::COMPUTER].map(&:capitalize)
        end
      end

      half do
        clear { label :text => "Player 2" }
        clear do 
          player_chooser :players => "drop_down", :id => "player_2",
            :choices => [TicTacToe::Player::HUMAN, TicTacToe::Player::COMPUTER].map(&:capitalize)
        end
      end
    end

  end

  clear do
    play_button :players => "button", :id => "play_button", :text => "play"
  end

end
