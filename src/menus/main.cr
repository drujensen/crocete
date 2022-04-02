module Menus
  class Main < Maps::Text
    def initialize
      super("1: Deck  2: Exit  3: Map  4: Inv.  5: Dex  ?: Help")

      on_key do |key|
        handle_key(key)
      end
    end

    def handle_key(key : Char)
      if key == '1'
        send(key: "deck", value: "show")
      end

      if key == '2'
        send(key: "exit", value: "show")
      end

      if key == '3'
        send(key: "map", value: "show")
      end

      if key == '4'
        send(key: "inv", value: "show")
      end

      if key == '5'
        send(key: "dex", value: "show")
      end

      if key == '?'
        send(key: "help", value: "show")
      end
    end
  end
end
