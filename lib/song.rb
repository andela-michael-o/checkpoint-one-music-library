class Song
  include Saveable

  attr_accessor :name, :genre
  attr_reader :artist
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist=(artist) if artist
    self.genre=(genre) if genre
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  class << self
    include ClassMethods
    include Concerns::Findable

    def new_from_filename(filename)
      track_name = filename.sub('.mp3', '')
      artist_name, song_name, genre_name = track_name.split(' - ')

      new(
        song_name,
        Artist.find_or_create_by_name(artist_name),
        Genre.find_or_create_by_name(genre_name)
      )
    end

    def create_from_filename(filename)
      new_from_filename(filename).tap(&:save)
    end
  end
end
