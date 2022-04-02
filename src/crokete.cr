require "tui-engine"
require "./menus/*"
require "./scenes/*"
require "./objects/*"
require "./dialogs/*"
require "./models/*"

module Crokete
  VERSION = "0.1.0"

  player = Models::Player.instance

  layout = Scenes::Layout.new
  home = Scenes::Home.new
  welcome = Dialogs::Welcome.new
  exit = Dialogs::Exit.new

  home.add(layout, x: 2, y: 2, z: 2)
  welcome.add(layout, z: 3)
  exit.add(layout, z: 4)

  home.on_message do |key, value|
    if key == "home" && value == "exit"
      home.hide
    end
  end

  if player.name != "Unknown"
    welcome.hide
  end

  game = TuiEngine.new(layout)
  game.on_message do |key, value|
    if key == "name"
      player.name = value
      player.save
    end
    if key == "exit" && value == "yes"
      game.stop
    end
  end

  game.run
end
