require "tui-engine"
require "./menus/*"
require "./scenes/*"
require "./objects/*"
require "./dialogs/*"
require "./models/*"

module Crokete
  VERSION = "0.1.0"

  data = Models::Data.instance

  layout = Maps::Frame.new(title: "Crocete")
  home = Scenes::Home.new
  field = Scenes::Field.new
  center = Scenes::Center.new

  menu = Menus::Main.new
  profile = Menus::Profile.new

  welcome = Dialogs::Welcome.new
  exit = Dialogs::Exit.new

  home.add(layout, y: 2, z: 2)
  field.add(layout, y: 2, z: 2)
  center.add(layout, y: 2, z: 2)

  menu.add(layout, x: 1, y: layout.height - 1, z: 2)
  profile.add(layout, x: layout.width - data.name.size - 2, y: 0, z: 2)

  welcome.add(layout, z: 3)
  exit.add(layout, z: 4)

  home.on_message do |key, value|
    if key == "home" && value == "exit"
      home.hide
      field.show
    end
    if key == "home" && value == "enter"
      home.show
      field.hide
    end
    if key == "center" && value == "exit"
      center.hide
      field.show
    end
    if key == "center" && value == "enter"
      center.show
      field.hide
    end
  end

  if data.name != "Unknown"
    welcome.hide
  end

  game = TuiEngine.new(layout)
  game.on_message do |key, value|
    if key == "name"
      data.name = value
      data.save
    end
    if key == "exit" && value == "yes"
      data.save
      game.stop
    end
  end

  game.run
end
