module Scenes
  class Home < Maps::Frame
    def initialize(title : String, width : Int32, height : Int32)
      super(title: title, width: width, height: height)
      hide
      player = Player.new(width: 1, height: 1, fill: '@')
      player.add(self, x: 2, y: 4, z: 1)
      mother = Mother.new(width: 1, height: 1, fill: 'a')
      mother.add(self, x: 2, y: 1, z: 1)
      hello = Maps::Text.new(text: "Hello, My Son!", speed: 15)
      hello.add(self, x: 4, y: 1, z: 2)
      hello.hide
      Events::Event.register("message") do |event|
        message = event.as(Events::Message)
        show if message.key == "name"
        if message.key == "mother"
          hello.show
        end
      end
    end
  end
end
