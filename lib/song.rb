class Song
  extend Concerns::ClassMethods

  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
  end

  def save
    self.class.class_variable_get(:@@all) << self
  end
end
