class Player < Maps::Base
  property prev_x : Int32 = 0
  property prev_y : Int32 = 0

  def initialize(height : Int32, width : Int32, fill : Char)
    super(height: height, width: width, fill: fill)

    on_key do |key|
      handle_key(key)
    end
    on_bump do |dir, x, y|
      set(x: @prev_x, y: @prev_y)
    end
    on_action do |sibling, x, y|
      if parent = @parent
        if @x == 14 && @y == 8
          parent.hide
        end
      end

      set(x: @prev_x, y: @prev_y)
    end
  end

  def handle_key(key : Char)
    if parent = @parent
      return unless parent.visible
    end

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
