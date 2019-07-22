require 'pry'

class MusicLibraryController

  def initialize(path='./db/mp3s')
    MusicImporter.new(path).import
  end
  
  def call
    input = " "
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    
    while input != "exit"
    input = gets.strip
      case input
      when "list songs"
      list_songs
      when "list artists"
      list_artists
      when "list genres"
      list_genres
      when "list artist"
      list_songs_by_artist
      when "list genre"
      list_songs_by_genre
      when "play song"
      play_song
      end 
    end
 end
 
  def list_songs
    
  end

   def list_artists
     index = 0 
     artist = Artist.all
     sorted_art = artist.sort {|a, b| a.name <=> b.name}
     sorted_art.each {|a|
     index += 1 
       puts "#{index}. #{a.name}"
     }
   end 

 
  private
  def sorted_songs
    Song.all.sort_by { |song| song.name }
  end

  def formatted_song(song)
    "#{song.artist.name} - #{song.name} - #{song.genre.name}"
  end
end