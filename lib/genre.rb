class Genre

  attr_accessor :name, :songs
  attr_reader :artists
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    @artist_collection = []
  end

  def Genre.all
    @@all
  end

  def Genre.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def Genre.create(name)
    genre = Genre.new(name)
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
