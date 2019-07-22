class MusicImporter
  
  attr_accessor :path
  
  def initialize(path)
    @path = path
    @files = Dir.entries(path).grep(/.*\.mp3/)
  end
  
   def files
    filename = []
    entries = Dir.glob("#{@path}/*.mp3")
    entries.map {|file| a = file.split("#{@path}/")
      filename << a[1]}
    return filename
  end
  
  def import 
    @files.each {|file| Song.create_from_filename(file)}
  end
end