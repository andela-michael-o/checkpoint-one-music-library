class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    @genre_collection = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    artist = new(name)
    self.all << artist
    artist
  end

  def add_song(song)
    song.setArtist(self)
    @songs << song unless @songs.include?(song)
  end

  def add_genre(genre)
    @genre_collection << genre unless @genre_collection.include?(genre)
  end

  def genres
    @genre_collection
  end
end
