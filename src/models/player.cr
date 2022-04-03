require "json"

module Models
  class Player
    include JSON::Serializable
    property name : String

    @@cache : String = ".cache"
    @@file : String = ".cache/crocete.json"
    @@instance : Models::Player?

    def initialize
      @name = "Unknown"
    end

    def self.instance : Player
      unless @@instance
        @@instance = Player.load
      end
      return @@instance.as(Player)
    end

    def self.load
      if File.exists? @@file
        Player.from_json File.read(@@file)
      else
        Player.new
      end
    end

    def save
      unless Dir.exists? @@cache
        Dir.mkdir_p(@@cache)
      end
      File.open(@@file, "w") do |file|
        file.puts(to_json())
      end
    end
  end
end
