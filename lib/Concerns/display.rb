require 'colorize'
module Concerns
  module Display
    MESSAGE = "Welcome.\nTo list all songs type \'list songs\'\n"\
              "To see a list of artists type \'list artists\'\n"\
              "To see alist of genres type \'list genres\'\n"\
              "To play a song type \'play song\'\n"\
              "To see a list of songs from an artist type \'list artist\'\n"\
              "To see a list of genres from an artist type \'list genre\'\n"\
              "Type exit to exit the program.".colorize(:green)

    def welcome_user
      puts MESSAGE
      prompt_user
    end

    def prompt_user
      print "\nEnter a command >> ".colorize(:light_blue)
    end

    def list_songs
      Song.all.each_with_index do |song, index|
        puts "\t#{index + 1}. #{song.artist.name} "\
             "- #{song.name} "\
             "- #{song.genre.name}"
      end
    end

    def list_artists
      Artist.all.each { |artist| puts "\t" << artist.name }
    end

    def list_genres
      Genre.all.each { |genre| puts genre.name }
    end

    def play_song
      print 'Enter a number between \'1\' and \'99\'>> '.colorize(:light_blue)
      song_num = gets.chomp.to_i
      if song_num > Song.all.size || song_num < 1
        puts 'No song with this number'.colorize(:red)
        return
      end
      song = Song.all[song_num - 1]
      puts "\tPlaying #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end

    def list_artist
      print 'Enter the artist\'s name >> '.colorize(:light_blue)
      artist_name = gets.chomp.downcase
      songs = Song.all.select { |song| song.artist.name.downcase == artist_name }
      if songs.size.zero?
        puts 'Unknown artist name'.colorize(:red)
      else
        songs.each do |song|
          puts "\t#{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
      end
    end

    def list_genre
      print 'Enter the genre name >> '.colorize(:light_blue)
      genre_name = gets.chomp.downcase
      selected_genre = Genre.all.detect { |genre| genre.name.downcase == genre_name }
      if selected_genre
        selected_genre.songs.each do |song|
          puts "\t#{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
      else
        puts 'Unknown genre'.colorize(:red)
      end
    end
  end
end
