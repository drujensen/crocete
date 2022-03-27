class Menus::Profile < Maps::Text
  property name : String = "Unknown"

  def initialize
    super(@name)
    Events::Event.register("message") do |event|
      message = event.as(Events::Message)
      if message.key == "name"
        @name = message.value
        update(@name)
        if parent = @parent
          @x = parent.width - @name.size - 2
        end
        @dirty = true
      end
    end
  end
end
