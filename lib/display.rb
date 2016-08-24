require 'colorize'
class Display
  MESSAGE = "Welcome.\nTo list all songs type \'list songs\'\n"\
            "To see a list of artists type \'list artists\'\n"\
            "To see alist of genres type \'list genres\'\n"\
            "To play a song type \'play song\'\n"\
            "To see a list of songs from an artist type \'list artist\'\n"\
            "To see a list of genres from an artist type \'list genre\'\n"\
            "Type \'exit\' to exit the program.".colorize(:green)

  def self.welcome_user
    puts MESSAGE
    prompt_user
  end

  def self.prompt_user
    print "\nEnter a command >> ".colorize(:light_blue)
  end

  def self.no_song_error
    puts 'No song with this number'.colorize(:red)
  end

  def self.no_genre_error
    puts 'Unknown genre'.colorize(:red)
  end

  def self.no_artist_error
    puts 'Unknown artist name'.colorize(:red)
  end

  def self.invalid_command
    puts "\nWrong command. Try again.\n".colorize(:red)
  end

  def self.prompt_for_song_number
    print 'Enter a number between \'1\' and \'99\'>> '.colorize(:light_blue)
  end

  def self.prompt_for_name(who)
    print "Enter the #{who} name >> ".colorize(:light_blue)
  end

  def self.print_array_details(songs)
    songs.each do |song|
      print_song_details song
    end
  end

  def self.print_song_details(pre_string = '', song)
    puts "\t" <<
         pre_string <<
         " #{song.artist.name} - #{song.name} - #{song.genre.name}"
  end

  def self.print_array(array)
    array.each { |model| puts "\t" << model.name }
  end

  def self.print_song_with_index(songs)
    songs.each_with_index do |song, index|
      puts "\t#{index + 1}. #{song.artist.name} "\
           "- #{song.name} "\
           "- #{song.genre.name}"
    end
  end
end
