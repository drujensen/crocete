module Scenes
  class Home < Maps::Frame
    def initialize
      super(title: "Your Home", width: 40, height: 12)

      # build house
      home = Maps::Sprite.new(sprite: <<-SPRITE
        _________________
        |_______________|
        |               |
        |               |
        |               |
        |               |
        |_______ _______|
        |______| |______|
        SPRITE
      )

      door = Maps::Base.new(width: 1, height: 1, fill: '#')
      mother = Maps::Base.new(width: 1, height: 1, fill: 'a')
      player = Player.new

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

      door.on_action do |sibling|
        if sibling == player
          send("home", "exit")
        end
      end

      mother.on_action do |sibling|
        if sibling == player
          hello.animate
        end
      end

      hello.add(self, x: 6, y: 1, z: 3)
      home.add(self, x: 6, y: 2)
      door.add(self, x: 14, y: 9)
      mother.add(self, x: 8, y: 4)
      player.add(self, x: 8, y: 6)
    end
  end
end
