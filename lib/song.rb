require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    new_song = self.new
    self.all << new_song
    new_song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    self.all << song
    song
  end

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      return name
    else
      self.new_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by! {|song| song.name}
  end

  def self.new_from_filename(names)
    songs = names.split(" - ")
    songs[1].slice!(".mp3")
    artist_name = songs[0]
    name = songs[1]
    new_song = self.new
    new_song.artist_name = artist_name
    new_song.name = name
    new_song
  end

    def self.create_from_filename(names)
    songs = names.split(" - ")
    songs[1].slice!(".mp3")
    artist_name = songs[0]
    name = songs[1]
    new_song = self.new
    new_song.artist_name = artist_name
    new_song.name = name
    self.all << new_song
    new_song
  end

  def self.destroy_all
    self.all.clear
  end



  def save
    self.class.all << self
  end

end
