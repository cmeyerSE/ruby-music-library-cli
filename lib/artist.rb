class Artist
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
    
      artist = Artist.new(name)
      artist.save
      artist
    end
  
    def songs 
      Song.all.select{|song| song.artist == self}
    end
  
    def add_song(song)

      if song.artist == nil
        song.artist = self
      end
    end
  
    def genres 
     
      artist_genres = []
      Song.all.each do |song|
        if song.artist == self 
          artist_genres << song.genre
        end
      end
      artist_genres.uniq
    end
  end