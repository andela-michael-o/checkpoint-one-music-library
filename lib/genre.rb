class Genre
  extend ClassMethods
  include Saveable

  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    @songs.push(song) unless @songs.include?(song)
  end

  def artists
    songs.map(&:artist).uniq
  end
end
