require "tui-engine"
require "./menus/*"
require "./scenes/*"
require "./objects/*"

module Crokete
  VERSION = "0.1.0"

  class MyGame < TuiEngine
    def initialize(map : Maps::Base)
      super(map)
      Events::Event.register("message") do |event|
        if event.as(Events::Message).value == "quit"
          stop
        end
        true
      end
    end
  end

  class World < Maps::Frame
    def initialize
      super(title: "Crocete")
    end
  end

  world = World.new
  menu = Menus::Main.new
  menu.add(world, x: 2, y: world.height - 1, z: 2)
  profile = Menus::Profile.new
  profile.add(world, x: world.width - 9, y: 0, z: 2)
  home = Scenes::Home.new(title: "Home", width: 40, height: 10)
  home.add(world, x: 2, y: 2, z: 2)
  welcome = Menus::Welcome.new
  welcome.add(world, z: 3)
  game = MyGame.new(world)
  game.run
end
