class MusicLibraryController

  def initialize(path="./db/mp3s")
    @path = path
    @music_importer = MusicImporter.new(path)
    @music_importer.import
  end

  def call
    print "Select an option>> "
    option = ""
    while option != "exit"
      option = gets
      do_option(option)
      print "Select an option>> "
    end
  end

  #helper methods
  private

  def do_option(option)
    case option
      when "list songs" then list_songs
      when "list artists" then list_artists
      when "list genres" then list_genres
      when "play song" then play_song
      when "list artist" then print_artist_name
      when "list genre" then print_genre
      else puts "Unrecognised command. Please try again"
    end
  end

  def list_songs
    count = 0
    @music_importer.files.each do |song|
      count += 1
      puts "#{count}. #{song.slice(0...-4)}"
    end
  end

  def list_artists
    @music_importer.files.each do |song|
      s = Song.create_from_filename(song)
      puts s.artist.name
    end
  end

  def list_genres
    @music_importer.files.each do |song|
      s = Song.create_from_filename(song)
      puts s.genre.name
    end
  end

  def play_song
    song_num = gets.to_i
    puts "Playing " + @music_importer.files[song_num - 1].slice(0...-4)
  end

  def print_artist_name
    artist_name = gets
    @music_importer.files.each do |song|
      puts song.slice(0...-4) if song.include?(artist_name)
    end
  end

  def print_genre
    genre_name = gets
    @music_importer.files.each do |song|
      puts song.slice(0...-4) if song.include?(genre_name)
    end
  end
end
