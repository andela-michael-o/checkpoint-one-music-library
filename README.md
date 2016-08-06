#Ruby Music Library

[![Code Climate](https://codeclimate.com/github/andela-mogala/checkpoint-one-music-library/badges/gpa.svg)](https://codeclimate.com/github/andela-mogala/checkpoint-one-music-library) [![Test Coverage](https://codeclimate.com/github/andela-mogala/checkpoint-one-music-library/badges/coverage.svg)](https://codeclimate.com/github/andela-mogala/checkpoint-one-music-library/coverage) [![Issue Count](https://codeclimate.com/github/andela-mogala/checkpoint-one-music-library/badges/issue_count.svg)](https://codeclimate.com/github/andela-mogala/checkpoint-one-music-library)

##DESCRIPTION
The Music Library application is a CLI built with Ruby. It manages music stored in any directory based on three criteria:
  * Song
  * Artist
  * Genre
The entry point to the application is the MusicLibraryController class which has a `call` method that starts up the command line.

##FEATURES
The application has the ability to:
  * List all songs in a directory
  * Give a non duplicated list of artists
  * Give a non duplicated list of genres
  * Play a song based on its index number
  * Display a list of songs from a particular artist
  * Display a list of genre from a particular artist

##COMMANDS
The corresponding commands for the features above are:
* list songs
* list artists
* list genres
* play song
* list artist
* list genre

###NB: 
The `play song` command doesn't actually play a song yet. It only simulates the occurence.

##DEPENDENCIES
You must have ruby installed on your computer for this application to work. Feel free to visit https://www.ruby-lang.org/en/documentation/installation/ for hints on how to install ruby on your machine.

##GETTING STARTED
* First clone the repository by typing the following line in your console:
  ```git clone git@github.com:andela-mogala/checkpoint-one-music-library.git```
* Next type change directory by typing
  ```cd checkpoint-one-music-library```
* Install the required gems by typing:
  ```bundle install```
Once the installation is done you can run the application by typing
```bin/musiclibrary```

##TESTING
If you are interested in running the tests you must make sure you have `rspec` gem installed, otherwise you can run ```gem install rspec``` to get it installed. Then you can just run ```rspec``` from the application's root folder while in console.
