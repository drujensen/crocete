class Mother < Maps::Base
  def initialize(height : Int32, width : Int32, fill : Char)
    super(height: height, width: width, fill: fill)
    Events::Event.register("action") do |event|
      Events::Event.message_event(key: "mother", value: "hello")
    end
  end
end
