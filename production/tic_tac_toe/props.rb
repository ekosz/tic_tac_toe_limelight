background do

  clear do
    grid :id => "grid" do
      9.times do |i|
        cell :id => "cell#{i+1}"
      end
    end
  end

  clear do
    message :id => "headline", :text => ""
  end
end
