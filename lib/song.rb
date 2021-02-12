class Song
  extend ClassMethods
  include Saveable

  attr_accessor :name
  attr_reader :artist
  @@all = []

  def initialize(name, artist = nil)
    @name = name
    self.artist=(artist) if artist
  end

  def artist=(artist)
    @artist = artist
    artist.add_song self
  end
end
