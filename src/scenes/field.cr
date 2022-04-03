module Scenes
  class Field < Maps::Frame
    def initialize
      super(title: "Nice Town", width: 80, height: 25)
      hide

      door = Maps::Base.new(width: 1, height: 1, fill: '#')
      house1 = House.new
      house2 = House.new
      house3 = House.new
      center = Center.new
      meadow = Meadow.new
      tree = Tree.new
      player = Player.new

      door.on_action do |sibling|
        if sibling == player
          send("home", "enter")
        end
      end

      house1.add(self, x: 2, y: 1, z: 2)
      door.add(self, x: 6, y: 5, z: 2)
      house2.add(self, x: 5, y: 17, z: 2)
      house3.add(self, x: 53, y: 17, z: 2)
      center.add(self, x: 20, y: 1, z: 2)
      tree.add(self, x: 36, y: 5, z: 2)
      meadow.add(self, x: 57, y: 8)
      player.add(self, x: 6, y: 6, z: 2)
    end
  end
end
