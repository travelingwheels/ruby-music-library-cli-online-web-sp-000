require 'pry'
class Artist 
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
  
  def self.create(artist)
    artist = Artist.new(artist) 
    artist.save
    artist
  end
  
  def songs
    @songs
  end
  
   def add_song(song)
    @songs << song unless songs.include?(song)
     song.artist = self unless song.artist
  end
  
  def genres
    songs.collect { |song| song.genre}.uniq
  end
end