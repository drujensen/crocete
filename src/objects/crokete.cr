class Crocete < Maps::Sprite
  def initialize
    super(sprite: <<-SPRITE
      +-------+
      | o   o |
      |  www  |
      +-------+
      SPRITE
    )
    add_sprite(sprite: <<-SPRITE
        ^__^
        (oo)
        (__)
      SPRITE
    )
  end
end
