class Menus::Profile < Maps::Text
  property name : String

  def initialize
    @name = Models::Data.instance.name
    super(@name)
    on_message do |key, value|
      if key == "name"
        @name = value
        update(@name)
        if parent = @parent
          @x = parent.width - @name.size - 2
        end
        @dirty = true
      end
    end
  end
end
