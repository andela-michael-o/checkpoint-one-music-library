class MusicLibraryPresenter
  class << self
    def list_songs(songs)
      track_list = []

      sorted_song_list(songs)
        .each_with_index { |song, index| track_list << "#{index + 1}. #{song}" }

      track_list.join ' '
    end

    def list_artists(songs)
      songs.map { |song| song.artist.name }.join ' '
    end

    def list_genres(songs)
      songs.map { |song| song.genre.name }.join ' '
    end

    def play_song(songs, track_number)
      track = sorted_song_list(songs)[track_number.to_i - 1]
      "Playing #{track}"
    end

    def list_artist(songs, artist_name)
      artist_songs = songs.select { |song| song.artist.name == artist_name }
      sorted_song_list(artist_songs).join ' '
    end

    def list_genre(songs, genre_name)
      genre_songs = songs.select { |song| song.genre.name == genre_name }
      sorted_song_list(genre_songs).join ' '
    end

    private

    def sorted_song_list(songs)
      songs.map { |song| "#{song.artist.name} - #{song.name} - #{song.genre.name}" }.sort
    end
  end
end
