class Artist
  extend ClassMethods
  extend Concerns::Findable
  include Saveable

  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    @songs.push(song) unless @songs.include?(song)
    song.artist ||= self
  end

  def genres
    songs.map(&:genre).uniq
  end
end
