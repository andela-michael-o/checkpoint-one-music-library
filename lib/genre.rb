class Genre
  extend ClassMethods
  include Saveable

  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
  end
end
