class Genre
    extend Concerns::Findable
  
    @@all = []
    attr_accessor :name
  
    def initialize(name)
      @name = name
    end
  
    def self.all 
      @@all 
    end
  
    def self.destroy_all 
      self.all.clear
    end
  
    def save
      @@all << self
    end
  
    def self.create(name)
     
      genre = Genre.new(name)
      genre.save
      genre
    end
  
    def songs 
      Song.all.select{|song| song.genre == self}
    end
  
    def add_song(song)
    
      if song.genre == nil
        song.genre = self
      end
    end
  
    def artists 
      
      genre_artists = []
      Song.all.each do |song|
        if song.genre == self 
          genre_artists << song.artist
        end
      end
      genre_artists.uniq
    end
end