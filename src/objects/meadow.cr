class Meadow < Maps::Sprite
  def initialize
    super(sprite: <<-SPRITE
         ;;;;;;;
       ;;;;;;;;;;;;
     ;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;
      ;;;;;;;;;;;;;
          ;;;;;;
    SPRITE
    )
  end
end
