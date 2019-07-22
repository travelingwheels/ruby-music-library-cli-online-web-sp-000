require 'pry'

class Song 
  
  attr_accessor :name, :artist, :genre
  @@all = []
 
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist != nil
    self.genre = genre if genre != nil
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  def save
     @@all << self 
    self
  end
  
  def self.create(name)
    # "initializes, saves, and returns the song" do
    #  created_song = Song.create("Kaohsiung Christmas")
    song = self.new(name)
    song.save
    song
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end
  
  def self.find_by_name(name)
    all.detect {|song| song.name == name}
  end
 
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end
  
  def self.new_from_filename(filename)
    split_filename = filename.gsub(".mp3", "").split(" - ")
    artist = Artist.find_or_create_by_name(split_filename[0])
    genre = Genre.find_or_create_by_name(split_filename[2])
    self.new(split_filename[1], artist, genre)
  end
  
  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end
end