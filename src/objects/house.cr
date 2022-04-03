class House < Maps::Sprite
  def initialize
    super(sprite: <<-SPRITE
      ________
     /       /\\
    /_______/  \\
    |# ___ #|  |
    |__| |__|__|
    SPRITE
    )
  end
end
