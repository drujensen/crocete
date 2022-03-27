class Player < Maps::Base
  property prev_x : Int32 = 0
  property prev_y : Int32 = 0

  def initialize(height : Int32, width : Int32, fill : Char)
    super(height: height, width: width, fill: fill)

    Events::Event.register("key") do |event|
      key = event.as(Events::Key)
      handle_key(key.key)
    end
    Events::Event.register("bump") do |event|
      set(x: @prev_x, y: @prev_y)
    end
    Events::Event.register("action") do |event|
      set(x: @prev_x, y: @prev_y)
    end
  end

  def handle_key(key : Char)
    @prev_x = @x
    @prev_y = @y

    if key == 'a'
      move(-1, 0)
    end

    if key == 'd'
      move(+1, 0)
    end

    if key == 's'
      move(0, +1)
    end

    if key == 'w'
      move(0, -1)
    end
  end
end
