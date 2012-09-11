on_button_pressed do
  scene.find_by_name("cell").each { |cell| cell.text = "" }

end
