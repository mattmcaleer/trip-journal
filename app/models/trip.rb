class Trip < ApplicationRecord
  #belongs_to :user
  belongs_to :place

  def place_name=(name)
    self.place = Place.find_or_create_by(name: name)
  end

  def place_name
    self.place ? self.place.name : nil
  end

end
