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

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(name)
    data = name.split(" - ")
    artist_name = data[0]
    name = data[1].delete_suffix('.mp3')
    song = self.new
    song.artist_name = artist_name
    song.name = name
    return song
  end

  def self.create_from_filename(name)
    self.new_from_filename(name).save
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    self.all.clear
  end

end
