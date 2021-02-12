class Genre
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
  end

  def save
    self.class.class_variable_get(:@@all) << self
  end

  class << self
    def all
      class_variable_get(:@@all)
    end

    def destroy_all
      class_variable_set(:@@all, [])
    end

    def create(*args)
      new(*args).tap { |genre| genre.save }
    end
  end
end
