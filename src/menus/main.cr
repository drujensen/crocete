module Menus
  class Main < Maps::Text
    def initialize
      super("1: Deck  2: Inv.  3: Dex  4: Map  5: Quit  ?: Help")

      on_key do |key|
        handle_key(key)
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
        send(key: "quit", value: "show")
      end

      if key == '?'
      end
    end
  end
end
