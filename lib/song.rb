class Song < MusicBase
  attr_reader :artist, :genre
  attr_accessor :name
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist.is_a? Artist
    self.genre = genre if genre.is_a? Genre
    self.artist.add_genre(genre) unless genre.nil?
    genre.artists = artist unless genre.nil? || artist.nil?
  end

  def artist=(artist)
    artist.add_song(self) unless artist.songs.include?(self)
    @artist ||= artist
  end

  def set_artist(artist)
    @artist = artist
  end

  def genre=(genre)
    genre.songs << self unless genre.songs.include?(self)
    @genre = genre
  end

  def self.new_from_filename(filename)
    split_names = filename.gsub('.mp3', '').split(' - ')
    song = Song.find_or_create_by_name(split_names[1])
    song.artist = Artist.find_or_create_by_name(split_names[0])
    song.genre = Genre.find_or_create_by_name(split_names[2])
    song
  end

  def self.create_from_filename(file_name)
    new_from_filename(file_name).save
  end
end
