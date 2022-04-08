module Scenes
  class Battle < Maps::Frame
    def initialize
      super(title: "Battle", width: 40, height: 15)
      hide

      enemy = Crocete.new
      enemy.set_active(pos: 0)

      player = Crocete.new
      player.set_active(pos: 1)

      enemy.add(self, x: width - enemy.width - 2, y: 1)
      player.add(self, x: 2, y: height - player.height - 1)
    end
  end
end
