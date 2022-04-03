class Center < Maps::Sprite
  def initialize
    super(sprite: <<-SPRITE
      __________
     /         /\\
    /_Center!_/  \\
    | # ___ # |  |
    |___| |___|__|
    SPRITE
    )
  end
end
