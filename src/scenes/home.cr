module Scenes
  class Home < Maps::Base
    def initialize
      super(width: 40, height: 12)
      title = Maps::Text.new("Your Home")

      # build house
      roof = Maps::Sprite.new(width: 17, height: 2)
      roof.add_sprite <<-SPRITE
      _________________
      |_______________|
      SPRITE

      left_floor = Maps::Sprite.new(width: 8, height: 2)
      left_floor.add_sprite <<-SPRITE
      |_______
      |______|
      SPRITE

      right_floor = Maps::Sprite.new(width: 8, height: 2)
      right_floor.add_sprite <<-SPRITE
      _______|
      |______|
      SPRITE

      left = Maps::Box.new(width: 1, height: 4, fill: '|')
      right = Maps::Box.new(width: 1, height: 4, fill: '|')
      door = Maps::Base.new(width: 1, height: 1, fill: ' ')
      mother = Maps::Base.new(width: 1, height: 1, fill: 'm')
      player = Player.new(width: 1, height: 1, fill: '@')

      hello = Maps::Scrolling.new(speed: 15, text: <<-TEXT
        Hello, my child!
        You are now 10 years old.
        It's time for you to
        become a Crocete trainer.
        Here are 10 catchers
        and 1 healing potion.
        Go to the training center
        and pick out your first Crocete.
        Good Luck!
        TEXT
      )

      door.on_action do |sibling, x, y|
        if sibling == player
          send("home", "exit")
        end
      end

      mother.on_action do |sibling, x, y|
        if sibling == player
          hello.animate
        end
      end

      title.add(self, x: 2, y: 0, z: 3)
      roof.add(self, x: 6, y: 2)
      left.add(self, x: 6, y: 4)
      right.add(self, x: 22, y: 4)
      left_floor.add(self, x: 6, y: 8)
      right_floor.add(self, x: 15, y: 8)
      door.add(self, x: 14, y: 10)
      mother.add(self, x: 8, y: 4)
      player.add(self, x: 8, y: 6)
      hello.add(self, x: 8, y: 1, z: 2)
    end
  end
end
