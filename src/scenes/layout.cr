module Scenes
  class Layout < Maps::Frame
    def initialize
      super(title: "Crocete")
      menu = Menus::Main.new
      menu.add(self, x: 1, y: @height - 1, z: 2)
      profile = Menus::Profile.new
      profile.add(self, x: @width - 9, y: 0, z: 2)
    end
  end
end
