class Artist < MusicBase
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    @genre_collection = []
  end

  def add_song(song)
    song.set_artist(self)
    @songs << song unless @songs.include?(song)
  end

  def add_genre(genre)
    @genre_collection << genre unless @genre_collection.include?(genre)
  end

  def genres
    @genre_collection
  end
end
