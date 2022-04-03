require "json"

module Models
  class Data
    include JSON::Serializable
    property name : String

    @@cache : String = ".cache"
    @@file : String = ".cache/crocete.json"
    @@instance : Models::Data?

    def initialize
      @name = "Unknown"
    end

    def self.instance : Data
      unless @@instance
        @@instance = Data.load
      end
      return @@instance.as(Data)
    end

    def self.load
      if File.exists? @@file
        Data.from_json File.read(@@file)
      else
        Data.new
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
