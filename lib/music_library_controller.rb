class MusicLibraryController
  COMMANDS = [
    'list songs',
    'list artists',
    'list genres',
    'play song',
    'list artist',
    'list genre'
  ].freeze

  def initialize(path = './db/mp3s')
    @path = path
    MusicImporter.new(path).import
  end

  def call
    Display.welcome_user
    run_repl_loop
  end

  private
  def run_repl_loop
    loop do
      user_choice = gets.chomp.downcase
      break if user_choice == 'exit'
      if user_choice_is_valid?(user_choice)
        execute_user_choice(user_choice)
      else
        Display.invalid_command
      end
      Display.prompt_user
    end
  end

  def list_songs
    Display.print_song_with_index(Song.all)
  end

  def list_artists
    Display.print_array(Artist.all)
  end

  def list_genres
    Display.print_array(Genre.all)
  end

  def play_song
    Display.prompt_for_song_number
    song_num = gets.chomp.to_i
    if song_num > Song.all.size || song_num < 1
      Display.no_song_error
      return
    end
    song = Song.all[song_num - 1]
    Display.print_song_details('Playing', song)
  end

  def list_artist
    Display.prompt_for_name('artist')
    artist_name = gets.chomp.downcase
    songs = Song.all.select { |song| song.artist.name.downcase == artist_name }
    if songs.size.zero?
      Display.no_artist_error
    else
      Display.print_array_details(songs)
    end
  end

  def list_genre
    Display.prompt_for_name('genre')
    genre_name = gets.chomp.downcase
    genre_pick = Genre.all.detect { |genre| genre.name.downcase == genre_name }
    if genre_pick
      Display.print_array_details(genre_pick.songs)
    else
      Display.no_genre_error
    end
  end

  def execute_user_choice(option)
    method_name = option.sub(' ', '_')
    send(method_name)
  end

  def user_choice_is_valid?(user_choice)
    COMMANDS.include?(user_choice)
  end
end
