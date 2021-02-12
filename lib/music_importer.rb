class MusicImporter

  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(path)
       .select { |filename| filename =~ /.mp3\z/i }
       .map { |filename| File.basename(filename) }
  end

  def import
    files.map { |file| Song.create_from_filename(file) }
  end
end
