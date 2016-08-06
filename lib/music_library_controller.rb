class MusicLibraryController
  include Concerns::HelperMethods

  def initialize(path="./db/mp3s")
    @path = path
    @music_importer = MusicImporter.new(path)
    @music_importer.import
  end

  def call
    welcome_user
    user_choice = ""
    while user_choice != "exit"
      user_choice = get_user_input.downcase
      execute_user_choice(user_choice) if user_choice_is_valid?(user_choice)
      prompt_user
    end
  end

  private

  def execute_user_choice(option)
    case option
      when "list songs" then list_songs
      when "list artists" then list_artists
      when "list genres" then list_genres
      when "play song" then play_song
      when "list artist" then print_artist_song
      when "list genre" then print_genres
    end
  end

  def list_songs
    count = 0
    Song.all.each do |song|
      count += 1
      print_with_newline "#{count}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    Artist.all.each do |artist|
      print_with_newline artist.name
    end
  end

  def list_genres
    Genre.all.each do |genre|
      print_with_newline genre.name
    end
  end

  def play_song
    print_out "Enter the song number like '1' or '23'>> "
    song_num = get_user_input.to_i
    song = Song.all[song_num - 1]
    output = "#{song.artist.name} - #{song.name} - #{song.genre.name}"
    print_with_newline "Playing #{output}"
  end

  def print_artist_song
    print_out "Enter the artist's name>> "
    artist_name = get_user_input
    results = Song.all.select {|song| song.artist.name == artist_name}
    if results
      results.each do |song|
        print_with_newline "#{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end
  end

  def print_genres
    print_out "Enter the genre name>> "
    genre_name = get_user_input
    selected_genres = Genre.all.select {|genre| genre.name == genre_name}
    if selected_genres
      selected_genres.each do |genre|
        genre.songs.each {|song| print_with_newline "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
      end
    end
  end

  def welcome_user
    prompt = <<-EOT
Welcome.\nTo list all songs type \"list songs\"
To see a list of artists type \"list artists\"
To see alist of genres type \"list genres\"
To play a song type \"play song\"
To see a list of songs from an artist type \"list artist\"
To see a list of genres from an artist type \"list genre\"
Type exit to exit the program.
EOT
    print_with_newline prompt
    prompt_user
  end

  def user_choice_is_valid?(user_choice)
    commands = [
                "list songs", "list artists", "list genres",
                "play song", "list artist", "list genre", "exit"
                ]
    return true if commands.include?(user_choice)
    print_with_newline "You entered a wrong command"
    false
  end

    def prompt_user
      print "\nEnter a command>> "
    end
end
