module Scenes
  class Center < Maps::Frame
    def initialize
      super(title: "Center", width: 40, height: 12)
      hide

      center = Maps::Sprite.new(sprite: <<-SPRITE
        ________________
        |______________|
        |     |  |     |
        |     ¯ ¯¯     |
        |              |
        |              |
        |_______ ______|
        |______| |_____|
        SPRITE
      )

      door = Maps::Base.new(width: 1, height: 1, fill: '#')
      master = Maps::Base.new(width: 1, height: 1, fill: 'a')
      player = Player.new

      hello = Maps::Scrolling.new(speed: 15, text: <<-TEXT
        Welcome to the Center!
        TEXT
      )

      door.on_action do |sibling|
        if sibling == player
          send("center", "exit")
        end
      end

      master.on_action do |sibling|
        if sibling == player
          hello.animate
        end
      end

      hello.add(self, x: 6, y: 1, z: 3)
      center.add(self, x: 6, y: 2)
      master.add(self, x: 13, y: 4)
      door.add(self, x: 14, y: 9)
      player.add(self, x: 14, y: 8)
    end
  end
end
