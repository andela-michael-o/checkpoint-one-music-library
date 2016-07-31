class MusicImporter

  attr_accessor :path
  attr_reader :files

  def initialize(path='./db/mp3s')
    @path = path
    @files = []
    self.load_files = path
    self.import
  end

  def load_files=(path)
    if File.exist?(path) and File.directory? path
      Dir.foreach(path) do |f|
        @files << f unless !f.include?(".mp3")
      end
    end
  end

  def import
    @files.each { |file| Song.new_from_filename(file)}
  end
end
