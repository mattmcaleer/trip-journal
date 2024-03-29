class Trip < ApplicationRecord
  belongs_to :user
  belongs_to :place
  validates :place_name, presence: true
  has_one_attached :image
  scope :current_user_trips, ->(id) { where("user_id = ?", id) }

  def place_name=(name)
    self.place = Place.find_or_create_by(name: name.titleize)
  end

  def place_name
    self.place ? self.place.name : nil
  end


end
