class MusicLibraryController

  def initialize(path="./db/mp3s")
    @path = path
    music_importer = MusicImporter.new(path)
    music_importer.import
    self.call
  end

  def call
    self.gets
  end

  def gets
    return "exit"
  end
end
