class Mother < Maps::Base
  def initialize(height : Int32, width : Int32, fill : Char)
    super(height: height, width: width, fill: fill)
    on_action do |sibling, x, y|
      if x == @x && y == @y
        Events::Event.message_event(key: "mother", value: "hello")
      end
    end
  end
end
