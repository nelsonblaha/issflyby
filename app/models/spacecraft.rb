class Spacecraft < ActiveRecord::Base
  attr_accessible :name, :lat, :long
  validates_presence_of :name
  has_many :passes

  def self.locate_iss
    location = HTTParty.get('http://api.open-notify.org/iss-now.json')
    puts location
  end

  def update_iss_location
    iss = Spacecraft.find_or_create_by(name: 'ISS')
    iss.update(lat:location['iss_position']['latitude'], long: location['iss_position']['latitude'])
  end
end
