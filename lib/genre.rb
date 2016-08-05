class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs
  attr_reader :artists
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    @artist_collection = []
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
    genre = new(name)
    Genre.all << genre
    genre
  end

  def artists=(artist)
    @artist_collection << artist unless @artist_collection.include?(artist)
  end

  def artists
    @artist_collection
  end
end
