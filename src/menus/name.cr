class Menus::Name < Maps::Sprite
  property name : String
  property key_event : Events::EventHandler

  def initialize
    super(width: 28, height: 6)
    @name = ""
    add_sprite <<-SPRITE
    ┌─Name─────────────────────┐
    │ Welcome to Crokete!      │
    │ Please choose your name! │
    │                          │
    │ Name:                    │
    └──────────────────────────┘
    SPRITE
    @key_event = Events::Event.register("key") do |event|
      key = event.as(Events::Key)
      handle_key(key.key)
    end
  end

  def handle_key(key : Char)
    if key == '\u007F'
      @name = @name.rchop
      @text[4][8 + @name.size] = ' '
    elsif key == '\r'
      hide
      Events::Event.deregister(@key_event)
    else
      @name = @name + key
    end

    @name.chars.each_with_index do |char, i|
      @text[4][8 + i] = char
    end

    @dirty = true
  end
end
