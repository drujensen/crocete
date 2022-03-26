module Menus
  class Main < Maps::Text
    def initialize
      super("1: Deck  2: Exit  3: Map  4: Inv.  5: Dex  ?: Help")
      Events::Event.register("key") do |event|
        key = event.as(Events::Key)
        handle_key(key.key)
      end
    end

    def handle_key(key : Char)
      if key == '1'
      end

      if key == '2'
        Events::Event.message_event(message: "quit")
      end

      if key == '3'
      end

      if key == '4'
      end

      if key == '5'
      end

      if key == '?'
      end
    end
  end
end
