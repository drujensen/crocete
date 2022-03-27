module Menus
  class Main < Maps::Text
    def initialize
      super("1: Deck  2: Inv.  3: Dex  4: Map  5: Quit  ?: Help")
      Events::Event.register("key") do |event|
        key = event.as(Events::Key)
        handle_key(key.key)
      end
    end

    def handle_key(key : Char)
      if key == '1'
      end

      if key == '2'
      end

      if key == '3'
      end

      if key == '4'
      end

      if key == '5'
        Events::Event.message_event(key: "cmd", value: "quit")
      end

      if key == '?'
      end
    end
  end
end
