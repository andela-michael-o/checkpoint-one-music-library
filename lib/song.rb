class Song
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :artist, :genre
  attr_writer :name
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist.is_a? Artist
    self.genre = genre if genre.is_a? Genre
    self.artist.add_genre(genre) unless genre == nil
    genre.artists = artist if genre != nil and artist != nil
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
    @artist ||= artist
  end

  def setArtist(artist)
    @artist = artist
  end

  def genre=(genre)
    genre.songs << self unless genre.songs.include?(self)
    @genre = genre
  end

  def Song.new_from_filename(filename)
    split_names = filename.split(" - ")
    song = Song.find_or_create_by_name(split_names[1])
    song.artist = Artist.find_or_create_by_name(split_names[0])
    song.genre = Genre.find_or_create_by_name(split_names[2].slice(0...-4))
    song
  end

  def Song.create_from_filename(file_name)
    song = Song.new_from_filename(file_name)
    song.save
    song
  end
end
