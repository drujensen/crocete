module Scenes
  class Home < Maps::Frame
    def initialize
      super(title: "Your Home", width: 30, height: 12)
      hide

      # build house
      roof = Maps::Sprite.new(width: 17, height: 2)
      roof.add_sprite <<-SPRITE
      _________________
      |_______________|
      SPRITE

      floor = Maps::Sprite.new(width: 17, height: 2)
      floor.add_sprite <<-SPRITE
      |_______ _______|
      |______| |______|
      SPRITE

      left = Maps::Box.new(width: 1, height: 4, fill: '|')
      right = Maps::Box.new(width: 1, height: 4, fill: '|')

      roof.add(self, x: 6, y: 2)
      left.add(self, x: 6, y: 4)
      right.add(self, x: 22, y: 4)
      floor.add(self, x: 6, y: 8)

      mother = Mother.new(width: 1, height: 1, fill: 'm')
      mother.add(self, x: 8, y: 4)

      player = Player.new(width: 1, height: 1, fill: '@')
      player.add(self, x: 7, y: 6)

      hello = Maps::Text.new(text: "Hello, My Son!")
      hello.add(self, x: 4, y: 1, z: 2)
      hello.hide

      on_key do |key|
        if hello.visible
          hello.hide if key == ' '
        end
      end

      on_message do |key, value|
        show if key == "name"
        hello.show if key == "mother"
      end
    end
  end
end
