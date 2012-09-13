background do

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
    main_menu  :players => "button", :id => "main_menu", :text => "Main Menu"
  end

end
