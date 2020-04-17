class COVID19::Country
  attr_accessor :name, :cases, :deaths, :recoveries, :active

  @@all = []

  def initialize(info_hash)
    info_hash.each {|key, value| self.send("#{key}=", value)}
    @@all << self
  end

  def self.all
    @@all
  end


  def self.find_by_name(name)
    @@all.find {|country| country.name == name}
  end
end
