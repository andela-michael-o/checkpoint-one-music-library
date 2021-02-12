class Song

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
  end

  def save
    self.class.class_variable_get(:@@all) << self
  end

  class << self
    def create(*args)
      new(*args).tap { |s| s.save }
    end

    def all
      class_variable_get(:@@all)
    end

    def destroy_all
      class_variable_set(:@@all, [])
    end
  end
end
