class Genre < MusicBase
  attr_accessor :songs, :name
  attr_reader :artists
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    @artist_collection = []
  end

  def artists=(artist)
    @artist_collection << artist unless @artist_collection.include?(artist)
  end

  def artists
    @artist_collection
  end
end
