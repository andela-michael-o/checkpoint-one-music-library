class MusicLibraryController
  def initialize(path = './db/mp3s')
    @path = path
    @music_importer = MusicImporter.new(path)
    @music_importer.import
  end

  def call
    welcome_user
    user_choice = ''
    while user_choice != 'exit'
      user_choice = gets.chomp.downcase
      execute_user_choice(user_choice) if user_choice_is_valid?(user_choice)
      prompt_user
    end
  end

  private

  def execute_user_choice(option)
    case option
    when 'list songs' then list_songs
    when 'list artists' then list_artists
    when 'list genres' then list_genres
    when 'play song' then play_song
    when 'list artist' then print_artist_song
    when 'list genre' then print_genres
    end
  end

  def list_songs
    count = 0
    Song.all.each do |song|
      count += 1
      puts "#{count}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    Artist.all.each { |artist| puts artist.name }
  end

  def list_genres
    Genre.all.each { |genre| puts genre.name }
  end

  def play_song
    print 'Enter the song number between \'1\' and \'99\'>> '
    song_num = gets.chomp.to_i
    if song_num >= Song.all.size || song_num <= 0
      puts 'No song with this number'
      return
    end
    song = Song.all[song_num - 1]
    puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
  end

  def print_artist_song
    print 'Enter the artist\'s name>> '
    artist_name = gets.chomp.downcase
    songs = Song.all.select { |song| song.artist.name.downcase == artist_name }
    if songs.size.zero?
      puts 'Unknown artist name'
    else
      songs.each do |song|
        puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end
  end

  def print_genres
    print 'Enter the genre name>> '
    genre_name = gets.chomp.downcase
    selected_genres = Genre.all.select { |genre| genre.name.downcase == genre_name }
    if selected_genres.size.zero?
      puts 'Unknown genre'
    else
      selected_genres.each do |genre|
        genre.songs.each { |song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}" }
      end
    end
  end

  def welcome_user
    prompt = <<-EOT
Welcome.\nTo list all songs type \'list songs\'
To see a list of artists type \'list artists\'
To see alist of genres type \'list genres\'
To play a song type \'play song\'
To see a list of songs from an artist type \'list artist\'
To see a list of genres from an artist type \'list genre\'
Type exit to exit the program.
EOT
    puts prompt
    prompt_user
  end

  def user_choice_is_valid?(user_choice)
    commands = [
                'list songs', 'list artists', 'list genres',
                'play song', 'list artist', 'list genre', 'exit'
                ]
    commands.include?(user_choice)
  end

  def prompt_user
    print '\nEnter a command>> '
  end
end
