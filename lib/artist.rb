class Artist

  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def Artist.all
    @@all
  end

  def Artist.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def Artist.create(name)
    artist = Artist.new(name)
    Artist.all << artist
    artist
  end

  def add_song(song)
    song.setArtist(self)
    @songs << song if !@songs.include?(song)
  end

end
