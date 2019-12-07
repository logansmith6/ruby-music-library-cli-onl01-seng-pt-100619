require 'bundler'
require 'pry'
Bundler.require

module Concerns
end

require_all 'lib'

###### Song class ######
class Song

  attr_accessor :name, :artist
  @@all = []

  def initialize(name, artist = "")
    @artist = artist
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.name
    self
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(created_song)
    banger = Song.new(created_song)
    banger.save
    banger
  end

  def artist
    @artist
  end

  def artist=()
    Artist.new.add_song(self)
  end

end

###### Artist class ######
class Artist

  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    @@all << self
  end

  def self.all
    @@all
  end

  def self.name
    self
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(created_artist)
    new_artist = Artist.new(created_artist)
    new_artist.save
    new_artist
  end

  def add_song(song)
    if song.artist == ""
      @songs << song
      song.artist = self
    #  binding.pry
    end
  end

end

###### Genre class ######
class Genre

  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.name
    self
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(created_genre)
    new_genre = Genre.new(created_genre)
    new_genre.save
    new_genre
  end
end
