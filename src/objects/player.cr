class Player < Maps::Base
  property prev_x : Int32 = 0
  property prev_y : Int32 = 0

  def initialize
    super(height: 1, width: 1, fill: '@')

    on_key do |key|
      handle_key(key)
    end

    on_bump do |dir, x, y|
      set(x: @prev_x, y: @prev_y)
    end

    on_action do |sibling|
      if sibling.z == @z
        hx = @x - sibling.x
        hy = @y - sibling.y
        if sibling.text[hy][hx]? != ' '
          set(x: @prev_x, y: @prev_y)
        end
      end
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
