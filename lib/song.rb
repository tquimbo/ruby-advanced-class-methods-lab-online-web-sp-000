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

  def self.new_from_filename
    rows = csv_data.split("\n")
    people = rows.collect do |row|
    data = row.split(", ")
    name = data[0]
    age = data[1]
    company = data[2]
    song = self.new
    song.name = name
    song.age = age
    song.company = company
    end
  return song
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
