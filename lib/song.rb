class Song

  attr_accessor :name
  attr_reader :artist
  @@all = []

  def initialize(name, artist = nil)
    @name = name
    self.artist = artist if artist.is_a? Artist
  end

  def Song.all
    @@all
  end

  def Song.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def Song.create(name)
    song = Song.new(name)
    Song.all << song
    song
  end

  def artist=(artist)
    artist.add_song(self) if !artist.songs.include?(self)
    #artist.songs << self if !artist.songs.include?(self)
    @artist ||= artist
  end

  def setArtist(artist)
    @artist = artist
  end
end
