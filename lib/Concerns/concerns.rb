module Concerns::Findable
  def find_by_name(name)
    class_variable_get(:@@all).each do |song|
      return song if name == song.name
    end
    nil
  end

  def find_or_create_by_name(name)
    if find_by_name(name)
      return find_by_name(name)
    end
    create(name)
  end
end
