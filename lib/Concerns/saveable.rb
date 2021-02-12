module Saveable
  def save
    self.class.all << self
  end
end
