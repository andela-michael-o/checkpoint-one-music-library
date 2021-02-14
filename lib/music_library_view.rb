require 'forwardable'

class MusicLibraryView
  extend Forwardable

  attr_reader :display, :controller
  def_delegators :display, :prompt, :render_line, :render_error

  def initialize(display, controller)
    @display = display
    @controller = controller
  end

  HELP_ME = %Q(
  To list all songs type \'list_songs\'
  To see a list of artists type \'list_artists\'
  To see alist of genres type \'list_genres\'
  To play a song type \'play_song\ <song_number>'
  To see a list of songs from an artist type \'list_artist\'
  To see a list of genres from an artist type \'list_genre\'
  Type \'exit\' to exit the program.
  ).colorize(:green)

  def help
    render_line HELP_ME
  end

  def list_songs(songs)
    track_list = []

    songs.each_with_index { |song, index| track_list << "#{index + 1}. #{format_song(song)}" }

    render_line track_list.join "\n"
  end

  def list_artists(artists)
    render_line artists.map(&:name).join "\n"
  end

  def list_genres(genres)
    render_line genres.map(&:name).join "\n"
  end

  def play_song
    song_number = prompt('Enter the song number >> ')
    song = controller.find_song(song_number.to_i)

    if song
      render_line "Playing #{format_song(song)}"
    else
      render_error "No song with that track number."
    end
  end

  def list_artist
    artist_name = prompt('Enter the artist\'s name >> ')
    artist = controller.find_artist(artist_name)

    if artist
      render_line artist.songs.map { |song| format_song(song) }.join "\n"
    else
      render_error "No artist with that name"
    end
  end

  def list_genre
    genre_name = prompt('Enter the genre name >> ')
    genre = controller.find_genre(genre_name)

    if genre
      render_line genre.songs.map { |song| format_song(song) }.join "\n"
    else
      render_error "No genre with that name"
    end
  end

  private

  def format_song(song)
    "#{song.artist.name} - #{song.name} - #{song.genre.name}"
  end
end
