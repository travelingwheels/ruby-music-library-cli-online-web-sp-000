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
     index = 0
     songs = Song.all
     sorted_songs = songs.sort {|song_a,song_b| song_a.name <=> song_b.name}
     sorted_songs.map {|s| 
      index += 1
      puts "#{index}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
      { :index => "#{s.name} by #{s.artist.name}"}
      }
   end

   def list_artists
     index = 0
     artists = Artist.all
     sorted_artists = artists.sort {|a,b| a.name <=> b.name}
     sorted_artists.each {|a| 
      index += 1
      puts "#{index}. #{a.name}"
     }
   end 
   
    def list_genres
   index = 0
   genres = Genre.all
   sorted_genres = genres.sort {|a,b| a.name <=> b.name}
   sorted_genres.each {|g| 
      index += 1
      puts "#{index}. #{g.name}"
   }
 end
 
 def list_songs_by_artist
   index = 0
   puts "Please enter the name of an artist:"
   input = gets.strip
   Artist.all.each {|a|
      if a.name == input
        sorted = a.songs.sort {|x,y| x.name <=> y.name}
            sorted.each {|o| 
            index += 1
            puts "#{index}. #{o.name} - #{o.genre.name}"}
      else nil 
      end
   }
 end
 
  def list_songs_by_genre
   index = 0
   puts "Please enter the name of a genre:"
   input = gets.strip
   Genre.all.each {|a|
      if a.name == input
        sorted = a.songs.sort {|x,y| x.name <=> y.name}
            sorted.each {|o| 
            index += 1
            puts "#{index}. #{o.artist.name} - #{o.name}"}
      else nil 
      end
   }
  end
  
  def play_song
    index = 0
    list = []
    songs = Song.all
    sorted_songs = songs.sort {|song_a,song_b| song_a.name <=> song_b.name}
      sorted_songs.each {|s| 
      index += 1
      list[index] = "#{s.name} by #{s.artist.name}"
      }
      
      puts "Which song number would you like to play?"  
      input = gets.strip.to_i
      if input.between?(1,list.size - 1)
      puts "Playing #{list[input]}"
      else 
      nil
      end
    #binding.pry
  end
end