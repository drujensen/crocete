module Scenes
  class Home < Maps::Frame
    def initialize
      super(title: "Your Home", width: 30, height: 12)

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
      mother = Maps::Base.new(width: 1, height: 1, fill: 'm')
      player = Player.new(width: 1, height: 1, fill: '@')

      hello = Maps::Scrolling.new(speed: 15, text: <<-TEXT
        Hello, My Son!
        How are you?
        TEXT
      )

      floor.on_action do |sibling, x, y|
        if sibling == player
          if player.x == 14 && player.y == 7
            hide
          end
        end
      end

      mother.on_action do |sibling, x, y|
        if sibling == player
          if player.x == 8 && player.y == 5
            hello.animate
          end
        end
      end

      roof.add(self, x: 6, y: 2)
      left.add(self, x: 6, y: 4)
      right.add(self, x: 22, y: 4)
      floor.add(self, x: 6, y: 8)
      mother.add(self, x: 8, y: 4)
      player.add(self, x: 7, y: 6)
      hello.add(self, x: 4, y: 1, z: 2)
    end
  end
end
