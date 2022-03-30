module Dialogs
  class Quit < Maps::Confirm
    def initialize
      super(key: "quit", title: "Quit?", question: "Do you want to quit?")
      hide
      on_message do |key, value|
        show if key == "quit" && value == "show"
      end
    end
  end
end
