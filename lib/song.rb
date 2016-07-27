class Song

  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
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
end
