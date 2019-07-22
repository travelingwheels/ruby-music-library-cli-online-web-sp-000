class Genre 
  extend Concerns::Findable
  
  attr_accessor :name, :songs
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def save
    @@all << self 
    self
  end
  
  def self.create(genre)
    created_genre = Genre.new(genre)
    created_genre.save
  end
  
  def add_song(song)
    @songs << song unless songs.include?(song)
     song.artist = self unless song.artist
   end
   
   def songs
    @songs
  end

   def artists
    self.songs.collect {|s| s.artist}.uniq
  end
end