class MusicLibraryController
  attr_reader :songs, :view
  def initialize(
    path = './db/mp3s',
    songs = MusicImporter.new(path).import,
    view = MusicLibraryView.new(ConsoleDisplay.new, self)
  )
    @path = path
    @songs = songs
    @view = view
  end

  def call
    view.help

    loop do
      # command format => verb_noun [arg]
      command = view.prompt

      begin
        __send__(method_name(command))
      rescue NoMethodError => exception
        view.render_error "Unknown Command. Please type 'help' to see the list of valid commands."
      end
    end
  end

  def help
    view.help
  end

  def list_songs
    view.list_songs(songs_sorted_by_artist)
  end

  def list_artists
    view.list_artists(artists)
  end

  def list_genres
    view.list_genres(genres)
  end

  def play_song
    view.play_song
  end

  def find_song(song_number)
    return nil if song_number > songs_sorted_by_artist.size
    songs_sorted_by_artist[song_number - 1]
  end

  def list_artist
    view.list_artist
  end

  def find_artist(artist_name)
    artists.find { |artist| artist.name == artist_name }
  end

  def list_genre
    view.list_genre
  end

  def find_genre(genre_name)
    genres.find { |genre| genre.name == genre_name }
  end

  private
  def artists
    @artists ||= songs.map(&:artist).uniq
  end

  def genres
    @genres ||= songs.map(&:genre).uniq
  end

  def songs_sorted_by_artist
    artists.each { |artist| artist.songs.sort_by(&:name) }
           .sort_by(&:name)
           .flat_map(&:songs)
  end

  def method_name(command)
    command.tr(' ', '_')
  end
end
