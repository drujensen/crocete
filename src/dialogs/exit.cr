module Dialogs
  class Exit < Maps::Confirm
    def initialize
      super(key: "exit", title: "Exit?", question: "Do you want to exit?")
      hide
      on_message do |key, value|
        show if key == "exit" && value == "show"
      end
    end
  end
end
