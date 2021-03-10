class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
  song = self.new
  song.save
  return song
  end

  def self.new_by_name(name)
    new = self.new
    new.name = name
    return new
  end

  def self.create_by_name(name)
    new = self.new
    new.name = name
    new.save
    return new
  end

  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
  self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical(name)
    self.sort_by{|song| song.name}
  end

  def self.new_from_filename

  end

  def self.create_from_filename

  end

  def self.all
  @@all
  end

  def self.destory_all
  self.all.clear
  end

  def save
  self.class.all << self
  end

end
