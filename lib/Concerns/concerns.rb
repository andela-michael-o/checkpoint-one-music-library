module Concerns
  module Findable
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

  module HelperMethods
    def print_with_newline(text)
      puts "#{text}"
    end

    def print_out(text)
      print "#{text}"
    end

    def get_user_input
      gets.chomp
    end

    def remove_mp3_extension(file_name)
      file_name.gsub(".mp3", "")
    end
  end

end
