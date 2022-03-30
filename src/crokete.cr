require "tui-engine"
require "./menus/*"
require "./scenes/*"
require "./objects/*"
require "./dialogs/*"

module Crokete
  VERSION = "0.1.0"

  class Game < TuiEngine
    def initialize(map : Maps::Base)
      super(map)
      on_message do |key, value|
        if key == "quit" && value == "yes"
          stop
        end
      end
    end
  end

  layout = Scenes::Layout.new

  home = Scenes::Home.new
  home.add(layout, z: 2)

  welcome = Dialogs::Welcome.new
  welcome.add(layout, z: 3)

  quit = Dialogs::Quit.new
  quit.add(layout, z: 4)

  game = Game.new(layout)
  game.run
end
