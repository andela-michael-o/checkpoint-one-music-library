class Artist

  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
  end

  def Artist.all
    @@all
  end

  def Artist.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def Artist.create(name)
    artist = Artist.new(name)
    Artist.all << artist
    artist
  end
end
