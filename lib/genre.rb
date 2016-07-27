class Genre

  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
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
end
