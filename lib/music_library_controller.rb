class MusicLibraryController
  def initialize(path = './db/mp3s')
    @path = path
    @songs = MusicImporter.new(path).import
  end

  def call
    commands = []
    loop do
      command = gets.chomp
      break if command == 'exit'
      commands << command
    end

    return if commands.empty?
    primary_command = commands.shift.tr(' ', '_')
    puts MusicLibraryPresenter.__send__(primary_command, @songs, *commands)
  end
end
